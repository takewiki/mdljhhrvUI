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
#' updateMFUI()
updateMFUI <- function(tabTitle ='更新管理费',
                     colTitles =c('操作区域','操作区域','显示区域'),
                     widthRates =c(6,6,12),
                     func_left = updateMFUI_left,
                     func_right =updateMFUI_right,
                     func_bottom = updateMFUI_bottom
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
#' updateMFUI_left()
updateMFUI_left <- function() {
  
  
  res <- tagList(
    mdl_numeric(
      id = 'text_updateMF_year',
      label = '年份',
      min = 2023,
      max = 2100,
      step = 1,
      value = as.integer(tsdo::getYear())
    ),
    mdl_numeric(
      id = 'text_updateMF_month',
      label = '月份',
      min = 1,
      max = 12,
      step = 1,
      value = as.integer(tsdo::getMonth())
    )
    
  )
  return(res)
  
}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' updateMFUI_bottom()
updateMFUI_right <- function() {
  res <- tagList(
    shiny::actionButton(inputId ="btn_updateMF" ,label ="更新管理费" ),
    
    
    
  )
  return(res)
  
}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' updateMFUI_bottom()
updateMFUI_bottom <- function() {
  res <- tagList(
    
    
  )
  return(res)
  
}
