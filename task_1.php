<!-- 1.выведите на экран из массива индексы тех элементов,
 которые делятся на 5 -->
<?php
$ar = array(10, 13, 15, 5, 0);
foreach ($ar as $key => $value) {
    if ($value%5 ==0){
        echo $key;
    }
}