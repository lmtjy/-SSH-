<?php
/**接收客户端提交的用户名，向客户端输出该用户的购物车详情**/
header('Content-Type: application/json;charset=UTF-8');

$productId = $_REQUEST['productId'];
$type=$_REQUEST['type'];
$checked=$_REQUEST['checked'];
$output=[];
//连接数据库
include('0_config.php'); //包含指定文件的内容在当前位置
$conn = mysqli_connect($db_url, $db_user, $db_pwd, $db_name, $db_port);

//SQL1: 设置编码方式
$sql = "SET NAMES UTF8";
mysqli_query($conn, $sql);

//SQL2:更新购物车详情
$sql="UPDATE hotel_cart_details SET checked='$checked' WHERE type='$type'  AND productId='$productId '";
$result = mysqli_query($conn,$sql);

if($result){
    $output['msg']="succ";
}else{
  $output['msg']="err";
}

echo json_encode($output);