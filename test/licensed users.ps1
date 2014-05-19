$regex = @'
(.+) лицен(.+) (.+)? для имени пользователя (.+?) код пользователя (.+)? узел (.+)?
'@
$get=0
select-string -path d:\temp1\AVFS*.txt -pattern "администратор" -allmatches –simplematch | foreach-object{if ($_ -match $regex)
  {
  $getStr=$Matches[1]
  if($getStr -like '*олучена*'){$get+=1}
  elseif($getStr -like '*ыпуск*'){$get-=1}
   $License = $matches[3]
   $Username = $matches[4]
   $UserId = $matches[5]
   $Node = $matches[6]
   $out=$get+"`t"+$License+"`t"+$Username+"`t"+$UserId+"`t"+$Node
   $out
  }}
  $get