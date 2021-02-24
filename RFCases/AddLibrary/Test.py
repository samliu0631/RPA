from CustomRFLib.PerformanceFeedback  import  get_sales_performance_feedback
from CustomRFLib.ExampleLibrary import ExampleLibrary  as EL


def main():
    print('this message is from main function')
    sales_result = 100
    sales_target = 200
    Comment = get_sales_performance_feedback(sales_result,sales_target)
    print('The comment from our boss is {}'.format(Comment))
    ExamlelibInst = EL()
    print( 'The date of today is {}\n'.format(ExamlelibInst.get_current_data() ) )


if __name__ == '__main__':
    main()