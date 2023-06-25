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
jhhrvUI <- function(tabTitle ='嘉好人资凭证区域',
                     colTitles =c('上传数据','生成凭证','显示区域'),
                     widthRates =c(6,6,12),
                     func_left = buttonUI_left,
                     func_right =buttonUI_right,
                     func_bottom = buttonUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' buttonUI_left()
buttonUI_left <- function() {


  res <- tagList(
    tsui::uiTemplate(templateName = '计提数据模版'),
    tsui::mdl_file(id = 'uploadfile', label =
                     '上传excel数据表'),
    tsui::mdl_ListChoose1(
      id = 'hr_sheet',
      label = '数据类型',
      choiceNames = list('工资', '社保', '工时'),
      choiceValues = list('工资', '社保', '工时'),
      selected = '工资'),
    shiny::actionButton(inputId = 'view' , label = '预览表单数据'),
    shiny::actionButton(inputId = 'btn_upload' , label = '确认上传数据')
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
buttonUI_right <- function() {
  res <- tagList(

    mdl_numeric(
      id = 'hr_year',
      label = '会计年度',
      min = 2023,
      max = 2100,
      step = 1,
      value = as.integer(tsdo::getYear())
    ),
    mdl_numeric(
      id = 'hr_month',
      label = '会计期间',
      min = 1,
      max = 12,
      step = 1,
      value = as.integer(tsdo::getMonth())
    )
    # tsui::mdl_integer(id = 'hr_month',label = 'month',min = 1,max = 12,step = 1)

    ,
    tsui::mdl_ListChoose1(
      id = 'environment',
      label = '选择操作环境',
      choiceNames = list('账套查询DMS测试', '江苏嘉好热熔胶股份有限公司'),
      choiceValues = list('账套查询DMS测试', '江苏嘉好热熔胶股份有限公司'),
      selected = '账套查询DMS测试'),
    shiny::actionButton(inputId = 'view_voucher', label = '凭证预览'),
    tsui::mdl_download_button(id = 'download_voucher',label = '预览下载'),
    shiny::actionButton(inputId = 'outputvoucher', label = '生成凭证'),
    # shiny::actionButton(inputId = 'outputvoucher2', label = '重新生成凭证'),
    # tsui::mdl_download_button(id = 'btn_Asone_download1',label = '下载成功日志'),
    tsui::mdl_download_button(id = 'btn_res_download',label = '下载日志')
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
buttonUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'view_data', label = '出口'))
  )
  return(res)

}
