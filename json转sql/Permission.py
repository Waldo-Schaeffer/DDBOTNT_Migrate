# 示例数据
json_data = {
    "Permission:1058063204:736637177:config": "",
    "Permission:1058063204:736637177:watch": "",
    "Permission:2788274955:Admin": "",
    "Permission:3050282104:Admin": "",
    "Permission:768823148:526517664:watch": "",
    "Permission:804954374:Admin": ""
}

# 处理每一个键，生成SQL插入语句
for key in json_data:
    parts = key.split(':')
    if len(parts) == 4:
        # 假设格式是 "Permission:qq_id:group_id:permission"
        qq_id, group_id, permission = parts[1], parts[2], parts[3]
    elif len(parts) == 3:
        # 假设格式是 "Permission:qq_id:permission"，群号可能不存在
        qq_id, permission = parts[1], parts[2]
        group_id = 'NULL'  # 如果没有群号，我们设为 NULL

    print(f"INSERT INTO `permission` (`qq_id`, `group_id`, `permission`) VALUES ({qq_id}, {group_id}, '{permission}');")
