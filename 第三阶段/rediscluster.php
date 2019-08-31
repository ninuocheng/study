<?php
$redis_list = ['192.168.4.51:6351','192.168.4.52:6352','192.168.4.53:6353','192.168.4.54:6354','192.168.4.55:6355','192.168.4.56:6356'];
$client = new RedisCluster(NUll,$redis_list);
$client->set("i","tarenaA");
$client->set("j","tarenaB");
$client->set("k","tarenaC");
echo $client->get("i");
echo $client->get("j");
echo $client->get("k");
?>
