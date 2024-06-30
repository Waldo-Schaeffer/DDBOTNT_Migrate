# 定义原始数据
data = {
    "Score:1067091523:2235238161": "1",
    "Score:340571776:2021450029": "1",
    "Score:696840817:3163659918": "1",
    "Score:708218802:2451517087": "1",
    "Score:708218802:2654895374": "1",
    "Score:732080822:1242625602": "1",
    "Score:732080822:2040582364": "1",
    "Score:732080822:2068193449": "1",
    "Score:768823148:1031629028": "1",
    "Score:768823148:939199819": "1",
    "Score:810339385:211063667": "1",
    "Score:832765035:1047749162": "1",
    "Score:832765035:837073220": "1",
    "Score:863580557:1342097816": "3",
    "Score:949503129:1208278030": "1",
    "Score:949503129:1239931607": "11",
    "Score:949503129:1245399658": "1",
    "Score:949503129:1420348991": "22",
    "Score:949503129:1432620851": "19",
    "Score:949503129:1465399026": "1",
    "Score:949503129:1548194685": "30",
    "Score:949503129:1573717618": "2",
    "Score:949503129:1704264840": "76",
    "Score:949503129:1766802729": "49",
    "Score:949503129:1902399786": "7",
    "Score:949503129:1928655437": "6",
    "Score:949503129:1939932310": "2",
    "Score:949503129:2060887386": "15",
    "Score:949503129:2086199970": "1",
    "Score:949503129:2106432677": "37",
    "Score:949503129:2147089954": "1",
    "Score:949503129:2235238161": "47",
    "Score:949503129:2445325583": "1",
    "Score:949503129:255090093": "14",
    "Score:949503129:2605619532": "2",
    "Score:949503129:2627386488": "8",
    "Score:949503129:2795342239": "105",
    "Score:949503129:2833079310": "3",
    "Score:949503129:2896314892": "3",
    "Score:949503129:2904734477": "2",
    "Score:949503129:292823724": "16",
    "Score:949503129:2973469778": "1",
    "Score:949503129:2995714756": "1",
    "Score:949503129:3085510583": "61",
    "Score:949503129:3102769521": "40",
    "Score:949503129:3126782616": "16",
    "Score:949503129:3193059816": "6",
    "Score:949503129:3281727742": "2",
    "Score:949503129:3320367335": "10",
    "Score:949503129:3320727281": "5",
    "Score:949503129:3418545905": "2",
    "Score:949503129:3435898874": "4",
    "Score:949503129:3452466027": "12",
    "Score:949503129:3474655194": "7",
    "Score:949503129:3512875080": "1",
    "Score:949503129:3522578921": "5",
    "Score:949503129:3526390245": "1",
    "Score:949503129:3527171098": "3",
    "Score:949503129:3548416143": "40",
    "Score:949503129:3562641604": "33",
    "Score:949503129:3568962887": "21",
    "Score:949503129:3607211431": "10",
    "Score:949503129:3614096161": "5",
    "Score:949503129:614082070": "1",
    "Score:949503129:703314215": "1",
    "Score:949503129:858483858": "1",
    "Score:949503129:949005396": "14",
    "Score:971939178:3629212055": "1",
    "Score:972738870:804954374": "1"
}

def group_check(group_id):
    """检查并转换群号格式"""
    return group_id

def qq_check(qq_id):
    """检查并转换QQ号格式"""
    return qq_id

# 解析数据并生成 SQL 语句
sql_statements = []
for key, value in data.items():
    _, group_id, qq_id = key.split(':')
    points = value
    gid = group_check(group_id)
    qid = qq_check(qq_id)
    sql_statement = f"INSERT INTO score (group_id, qq_id, points) VALUES ({gid}, {qid}, {points});"
    sql_statements.append(sql_statement)

# 打印所有生成的 SQL 语句
for statement in sql_statements:
    print(statement)
