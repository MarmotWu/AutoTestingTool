Feature: 判断主商品和赠品的商品状态

    @api
    Scenario: 初始化数据, 调用接口登录并获取token
        Given 我要测试一个API, API属于子系统:frontapi, API的别名是:signin
        Given API的method是:post
        Given API的body来自测试数据文件inputdata2.config中user_info节点的signin关键字
        Given 将API的body中的变量userID赋值为AutoTest1
        Given 将API的body中的变量password赋值为AutoTest1
        When 我调用了api
        Then 我需要验证response code是:200
        Then 将response(json)的body中的某个值作为变量存入上下文, JsonPath:$.data.sessionId, 存为变量名:token
    
    @api
    Scenario: 主商品库存足，能结算
        Given 我要测试一个API,从数据文件[inputdata2.config]的节点[主商品库存足，能结算]获取参数,测试场景是[主商品库存足，能结算]
        Given 添加一个header到api请求, header名是:token, header值来自上下文的变量:token
        When 我调用了api
        Then 我需要验证response code是:200
        Then 我需要验证response中指定JsonPath:$.data.shippingFee的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalCount的值是:7
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalPrice的值是:40.8
        Then 我需要验证response中指定JsonPath:$.data.discountTotalAmount的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsId的值是:1527
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsQuantity的值是:6
        Then 我需要验证response中指定JsonPath:$.data.goods[1].goodsId的值是:1246
        Then 我需要验证response中指定JsonPath:$.data.goods[1].goodsQuantity的值是:1
        Then 我需要验证response中指定JsonPath:$.data.couponDiscountAmount的值是:0
    
    @api
    Scenario: 主商品库存不足能结算
        Given 我要测试一个API,从数据文件[inputdata2.config]的节点[主商品库存不足能结算]获取参数,测试场景是[主商品库存不足能结算]
        Given 添加一个header到api请求, header名是:token, header值来自上下文的变量:token
        When 我调用了api
        Then 我需要验证response code是:200
        Then 我需要验证response中指定JsonPath:$.data.shippingFee的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalCount的值是:7
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalPrice的值是:78.8
        Then 我需要验证response中指定JsonPath:$.data.discountTotalAmount的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsId的值是:1016
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsQuantity的值是:6
        Then 我需要验证response中指定JsonPath:$.data.goods[1].goodsId的值是:1246
        Then 我需要验证response中指定JsonPath:$.data.goods[1].goodsQuantity的值是:1
        Then 我需要验证response中指定JsonPath:$.data.couponDiscountAmount的值是:0
        Then 我需要验证response中指定JsonPath:$.data.resultMessage[0].messageType的值是:2
        Then 我需要验证response中指定JsonPath:$.data.resultMessage[0].message的值是:活动已结束，自动化测试满赠库存足-云南曲靖沾益辣子鸡450g（志辉食作）赠品已恢复原价
    
    @api
    Scenario: 赠品足，能结算
        Given 我要测试一个API,从数据文件[inputdata2.config]的节点[赠品足，能结算]获取参数,测试场景是[赠品足，能结算]
        Given 添加一个header到api请求, header名是:token, header值来自上下文的变量:token
        When 我调用了api
        Then 我需要验证response code是:200
        Then 我需要验证response中指定JsonPath:$.data.shippingFee的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalCount的值是:7
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalPrice的值是:40.8
        Then 我需要验证response中指定JsonPath:$.data.discountTotalAmount的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsId的值是:1527
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsQuantity的值是:6
        Then 我需要验证response中指定JsonPath:$.data.goods[1].goodsId的值是:1246
        Then 我需要验证response中指定JsonPath:$.data.goods[1].goodsQuantity的值是:1
        Then 我需要验证response中指定JsonPath:$.data.couponDiscountAmount的值是:0
        Then 我需要验证response中指定JsonPath:$.data.resultMessage的值是:None

    @api
    Scenario: 赠品库存不足，提示赠品不足能结算
        Given 我要测试一个API,从数据文件[inputdata2.config]的节点[赠品库存不足，提示赠品不足能结算]获取参数,测试场景是[赠品库存不足，提示赠品不足能结算]
        Given 添加一个header到api请求, header名是:token, header值来自上下文的变量:token
        When 我调用了api
        Then 我需要验证response code是:200
        Then 我需要验证response中指定JsonPath:$.data.shippingFee的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalCount的值是:5
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalPrice的值是:34
        Then 我需要验证response中指定JsonPath:$.data.discountTotalAmount的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsId的值是:1527
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsQuantity的值是:5
        Then 我需要验证response中指定JsonPath:$.data.couponDiscountAmount的值是:0
        Then 我需要验证response中指定JsonPath:$.data.resultMessage[0].messageType的值是:2
        Then 我需要验证response中指定JsonPath:$.data.resultMessage[0].message的值是:赠品已送完
    
    @api
    Scenario: 赠品库存小于赠送数量，提示赠品不足，能结算
        Given 我要测试一个API,从数据文件[inputdata2.config]的节点[赠品库存小于赠送数量，提示赠品不足，能结算]获取参数,测试场景是[赠品库存小于赠送数量，提示赠品不足，能结算]
        Given 添加一个header到api请求, header名是:token, header值来自上下文的变量:token
        When 我调用了api
        Then 我需要验证response code是:200
        Then 我需要验证response中指定JsonPath:$.data.shippingFee的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalCount的值是:8
        Then 我需要验证response中指定JsonPath:$.data.goodsTotalPrice的值是:54.4
        Then 我需要验证response中指定JsonPath:$.data.discountTotalAmount的值是:0
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsId的值是:1527
        Then 我需要验证response中指定JsonPath:$.data.goods[0].goodsQuantity的值是:8
        Then 我需要验证response中指定JsonPath:$.data.couponDiscountAmount的值是:0
        Then 我需要验证response中指定JsonPath:$.data.resultMessage[0].messageType的值是:2
        Then 我需要验证response中指定JsonPath:$.data.resultMessage[0].message的值是:赠品已送完
   