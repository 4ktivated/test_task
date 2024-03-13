<!-- 6. напишите функцию, на вход которой передаётся массив чисел, а в ответ возвращается только массив из 
 - уникальных чисел
 - чисел, которые встречаются только 1 раз -->

<?php
interface Task7 {

    public function main_func();
}

class Uniq_number implements Task7
{
    public array $ar;

    public function __construct(array $ar)
    {
        $this->ar = $ar;
    }

    public function main_func()
    {
        return array_unique($this->ar);
    }
} 

class One_time implements Task7
{
    public array $ar;

    public function __construct(array $ar)
    {
        $this->ar = $ar;
    }

    public function main_func()
    {
        $result = [];
        foreach ($this->ar as $value) {
            if (array_count_values($this->ar)[$value] == 1) {
                $result[] = $value;
            }
        }
        return $result;
    }
}

$test_arr = [4,1,2,1,2,3,6];

$uniq_number = new Uniq_number($test_arr);
$one_time = new One_time($test_arr);

print_r($uniq_number->main_func());
print_r($one_time->main_func());





