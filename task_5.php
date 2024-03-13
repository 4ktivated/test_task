<!-- 5. Напишите функцию, которая принимает дату в формате "Day Month Year" и возвращает дату в формате YYYY-MM-DD, где
Day может состоять из {"1st", "2nd", "3rd", "4th", ..., "30th", "31st"}.
Month может состоять из {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}.
Year находится в диапазоне [1900, 2100].

Пример:
  На входе: "17th Oct 2020"
  На выходе: "2020-10-17" -->


<?php
function convert_date($date){
    $check_mon = array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
    $date = explode(' ', $date);
    
    $res_mon = array_search($date[1], $check_mon) + 1;
    $res_day = substr($date[0], 0 ,-2);
    $res_year = (int)$date[2];
    if (1900 < $res_year and $res_year < 2100){
            $res_year = $date[2];
        }else{
        echo 'год не входит в дупущенный диапазон';}

    return implode('-',[$res_year, $res_mon, $res_day]);
}

echo convert_date("17th Oct 2020");