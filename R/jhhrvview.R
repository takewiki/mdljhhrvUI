#' 按纽生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' buttonUI()
jhhrvviewUI <- function(tabTitle ='上传数据',
                                 colTitles =c('操作区','显示区域'),
                                 widthRates =c(4, 8),
                                 func_left = buttonvoucherviewUI_left,
                                 func_right =buttonvoucherviewUI_right
) {
  
  
  res = tsui::uiGen(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right)
  return(res)
}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' buttonUI_left()
buttonvoucherviewUI_left <- function() {


  res <- tagList(
    tsui::uiTemplate(templateName = '嘉好人资凭证数据模版'),
    tsui::mdl_file(id = 'btn_hrv_voucher_uploadfile', label =
                     '上传excel数据表'),
    tsui::mdl_ListChoose1(
      id = 'btn_hrv_voucher_sheet',
      label = '选择预览数据类型',
      choiceNames = list('工资', '社保', '工时'),
      choiceValues = list('工资', '社保', '工时'),
      selected = '工资'),
    shiny::actionButton(inputId = 'btn_hrv_voucher_view' , label = '预览表单数据'),
    shiny::actionButton(inputId = 'btn_hrv_voucher_upload' , label = '确认上传所有数据')
    # shiny::actionButton(inputId = 'btn_reupload' , label = '重新上传数据')

  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' buttonUI_bottom()
buttonvoucherviewUI_right <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'btn_hrv_voucher_view_data', label = '出口'))
  )
  return(res)

}
