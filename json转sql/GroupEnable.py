import json

# 假定这是你的JSON数据
data = {
    "GroupEnable:1058063204:watch": "enable",
    "GroupEnable:1131108614:watch": "disable",
    "GroupEnable:166487082:watch": "disable",
    "GroupEnable:240621346:watch": "enable",
    "GroupEnable:524842826:watch": "disable",
    "GroupEnable:537205434:watch": "disable",
    "GroupEnable:539202422:watch": "disable",
    "GroupEnable:549814625:watch": "disable",
    "GroupEnable:667571612:watch": "enable",
    "GroupEnable:708218802:watch": "disable",
    "GroupEnable:732080822:watch": "disable",
    "GroupEnable:768823148:watch": "disable",
    "GroupEnable:810339385:watch": "disable",
    "GroupEnable:865915509:watch": "disable",
    "GroupEnable:874155212:watch": "disable",
    "GroupEnable:912328371:watch": "disable",
    "GroupEnable:972738870:watch": "enable",
    "GroupEnable:972738870:色图": "enable"
}

def generate_sql(data):
    sql_statements = []
    for key, value in data.items():
        parts = key.split(":")
        if len(parts) == 3 and parts[0] == "GroupEnable":
            group_id = parts[1]
            command = parts[2]
            status = value
            # 生成SQL语句
            sql = f"INSERT INTO `groupenable` (`group_id`, `command`, `status`) VALUES ({group_id}, '{command}', '{status}');"
            sql_statements.append(sql)
    return sql_statements

# 生成SQL语句
sql_statements = generate_sql(data)

# 打印SQL语句
for sql in sql_statements:
    print(sql)
