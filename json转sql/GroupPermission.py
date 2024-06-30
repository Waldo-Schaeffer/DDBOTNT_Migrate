import json

# 假设json_data是一个包含你提供的JSON数据的字典
json_data = {
    "GroupPermission:1014391660:804954374:GroupAdmin": "",
    "GroupPermission:1058063204:736637177:GroupAdmin": "",
    "GroupPermission:1058063204:804954374:GroupAdmin": "",
    "GroupPermission:1077984598:3050282104:GroupAdmin": "",
    "GroupPermission:205191416:804954374:GroupAdmin": "",
    "GroupPermission:240621346:3050282104:GroupAdmin": "",
    "GroupPermission:493547281:609457424:GroupAdmin": "",
    "GroupPermission:493547281:804954374:GroupAdmin": "",
    "GroupPermission:537205434:804954374:GroupAdmin": "",
    "GroupPermission:539202422:804954374:GroupAdmin": "",
    "GroupPermission:549814625:804954374:GroupAdmin": "",
    "GroupPermission:680046944:804954374:GroupAdmin": "",
    "GroupPermission:691308938:804954374:GroupAdmin": "",
    "GroupPermission:732080822:332058770:GroupAdmin": "",
    "GroupPermission:810339385:804954374:GroupAdmin": "",
    "GroupPermission:874155212:804954374:GroupAdmin": "",
    "GroupPermission:905855530:804954374:GroupAdmin": "",
    "GroupPermission:912328371:943190460:GroupAdmin": "",
    "GroupPermission:954983978:2788274951:GroupAdmin": "",
    "GroupPermission:972738870:804954374:GroupAdmin": ""
}

# 解析数据并生成SQL语句
sql_inserts = []
for key in json_data:
    if key.startswith("GroupPermission:"):
        parts = key.split(':')
        group_id = parts[1]
        qq_id = parts[2]
        sql_inserts.append(f"INSERT INTO `grouppermission` (`group_id`, `qq_id`) VALUES ({group_id}, {qq_id});")

# 打印所有SQL插入语句
for sql in sql_inserts:
    print(sql)
