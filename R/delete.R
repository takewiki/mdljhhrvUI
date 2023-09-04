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
#' deleteUI()
deleteUI <- function(tabTitle ='清除数据',
                     colTitles =c('操作区域','操作区域','显示区域'),
                     widthRates =c(4,8,12),
                     func_left = deleteUI_left,
                     func_right =deleteUI_right,
                     func_bottom = deleteUI_bottom
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
#' deleteUI_left()
deleteUI_left <- function() {
  
  
  res <- tagList(
    mdl_numeric(
      id = 'text_hrv_voucher_year',
      label = '会计年度',
      min = 2023,
      max = 2100,
      step = 1,
      value = as.integer(tsdo::getYear())
    ),
    mdl_numeric(
      id = 'text_hrv_voucher_month',
      label = '会计期间',
      min = 1,
      max = 12,
      step = 1,
      value = as.integer(tsdo::getMonth())
    )
    ,
    tsui::mdl_ListChoose1(
      id = 'text_hrv_voucher_environment',
      label = '请选择费用承担组织',
      choiceNames = list('江苏', '上海','太仓'),
      choiceValues = list('江苏','上海','太仓'),
      selected = '江苏'),
  )
  return(res)
  
}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' deleteUI_bottom()
deleteUI_right <- function() {
  res <- tagList(
    shiny::actionButton(inputId ="btn_salary" ,label ="清除工资相关数据" ),
 
    shiny::actionButton(inputId ="btn_socialsecurity" ,label ="清除社保相关数据" ),
    shiny::actionButton(inputId ="btn_rddetail" ,label ="清除研发工时相关数据" ),
    shiny::actionButton(inputId ="btn_nonrddetail" ,label ="清除非研发工时相关数据" )
    
      
    
  )
  return(res)
  
}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' deleteUI_bottom()
deleteUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'delete_view_data', label = '出口'))
    
    
  )
  return(res)
  
}
