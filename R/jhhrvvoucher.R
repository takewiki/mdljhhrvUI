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
jhhrvvoucherUI <- function(tabTitle ='生成凭证',
                                 colTitles =c('操作区','显示区域'),
                                 widthRates =c(4, 8),
                                 func_left = buttonvoucherUI_left,
                                 func_right =buttonvoucherUI_right
) {
  
  
  res = tsui::uiGen(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right)
  return(res)
}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' buttonUI_bottom()
buttonvoucherUI_left <- function() {
  res <- tagList(

    mdl_numeric(
      id = 'btn_hrv_voucher_year',
      label = '会计年度',
      min = 2023,
      max = 2100,
      step = 1,
      value = as.integer(tsdo::getYear())
    ),
    mdl_numeric(
      id = 'btn_hrv_voucher_month',
      label = '会计期间',
      min = 1,
      max = 12,
      step = 1,
      value = as.integer(tsdo::getMonth())
    )
    # tsui::mdl_integer(id = 'hr_month',label = 'month',min = 1,max = 12,step = 1)

    ,
    tsui::mdl_ListChoose1(
      id = 'btn_hrv_voucher_environment',
      label = '选择操作环境',
      choiceNames = list('账套查询DMS测试', '江苏嘉好热熔胶股份有限公司'),
      choiceValues = list('账套查询DMS测试', '江苏嘉好热熔胶股份有限公司'),
      selected = '账套查询DMS测试'),
    shiny::actionButton(inputId = 'btn_hrv_voucher_view_voucher', label = '凭证生成预览'),
    tsui::mdl_download_button(id = 'btn_hrv_voucherview_download',label = '预览日志下载'),
    shiny::actionButton(inputId = 'btn_hrv_voucher_outputvoucher', label = '凭证同步至ERP'),
    # shiny::actionButton(inputId = 'outputvoucher2', label = '重新生成凭证'),
    # tsui::mdl_download_button(id = 'btn_Asone_download1',label = '下载成功日志'),
    tsui::mdl_download_button(id = 'btn_hrv_voucher_download',label = '下载ERP同步日志')
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
buttonvoucherUI_right <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'btn_hrv_voucher_data', label = '出口'))
  )
  return(res)

}
