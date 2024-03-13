<!-- 4. Создайте веб страницу, которая будет выводить иерархию сотрудников в древовидной форме.
 Информация о каждом сотруднике должна храниться в базе данных и содержать следующие данные:
  - ФИО;
  - Должность;
  - Дата приема на работу;
  - Размер заработной платы;
  - У каждого сотрудника есть 1 начальник;
  - База данных должна содержать не менее 1000 сотрудников и 5 уровней иерархий. -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>tree menu</title>
    <style>
        ul { list-style-type: none; }
        ul ul { margin-left: 20px; }
    </style>
</head>
<body>
    <div>

    <?php
        $host = 'localhost';
        $dbname = 'postgres';
        $user = 'postgres';
        $password = 'postgres';
        $dsn = "pgsql:host=$host;dbname=$dbname";

        $db = new PDO($dsn, $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT * FROM workers ";
        $stmt = $db->prepare($sql);
        $stmt->execute();
        $stmt = $stmt->fetchAll();

        function has_assistant($rows,$id) {
            foreach ($rows as $row) {
            if ($row['boss_id'] == $id)
                return true;
            }
            return false;
        }
        function build_tree_menu($all_workers,$boss=0)
        {  
            $result = "<ul>";
            foreach ($all_workers as $worker)
            {
            if ($worker['boss_id'] == $boss){
                $result.= "<li>{$worker['name']}({$worker['position']})";
                if (has_assistant($all_workers,$worker['id']))
                $result.= build_tree_menu($all_workers,$worker['id']);
                $result.= "</li>";
            }
            }
            $result.= "</ul>";
        
            return $result;
        }

        echo build_tree_menu($stmt,$boss=0);
    ?>
    </div>
</body>
</html>
