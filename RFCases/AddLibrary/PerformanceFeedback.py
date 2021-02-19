def get_sales_performance_feedback(sales_result, sales_target):
    ratio = int (sales_result) / int(sales_target)
    if ratio >=1:
        return "A great result!"
    elif ratio >0.75:
        return 