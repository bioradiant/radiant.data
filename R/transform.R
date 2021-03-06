#' Center
#' @param x Input variable
#' @param na.rm If TRUE missing values are removed before calculation
#' @return If x is a numeric variable return x - mean(x)
#' @export
center <- function(x, na.rm = TRUE)
	if (is.numeric(x)) { x - mean(x, na.rm = na.rm) } else x

#' Standardize
#' @param x Input variable
#' @param na.rm If TRUE missing values are removed before calculation
#' @return If x is a numberic variable return center(x) / mean(x)
#' @export
standardize <- function(x, na.rm = TRUE) {
	if (is.numeric(x)) {
    center(x, na.rm = na.rm) / sd(x, na.rm = na.rm)
  } else {
    x
  }
}

#' Calculate square of a variable
#' @param x Input variable
#' @return x^2
#' @export
square <- function(x) x^2

#' Calculate inverse of a variable
#' @param x Input variable
#' @return 1/x
#' @export
inverse <- function(x)
  if (is.numeric(x)) 1/x else x

#' Normalize a variable x by a variable y
#' @param x Input variable
#' @param y Normalizing variable
#' @return x/y
#' @export
normalize <- function(x, y)
  if (is.numeric(x) && is.numeric(y)) x/y else x

#' Convert input in month-day-year format to date
#' @details Use as.character if x is a factor
#' @param x Input variable
#' @return Date variable of class Date
#' @examples
#' as_mdy("2-1-2014")
#' \dontrun{
#' as_mdy("2-1-2014") %>% month(label = TRUE)
#' as_mdy("2-1-2014") %>% week
#' as_mdy("2-1-2014") %>% wday(label = TRUE)
#' }
#' @export
as_mdy <- function(x)
  {if (is.factor(x)) as.character(x) else x} %>% {sshhr(mdy(.))} %>% as.Date

#' Convert input in day-month-year format to date
#' @param x Input variable
#' @return Date variable of class Date
#' @examples
#' as_dmy("1-2-2014")
#'
#' @export
as_dmy <- function(x)
  {if (is.factor(x)) as.character(x) else x } %>% {sshhr(dmy(.))} %>% as.Date

#' Convert input in year-month-day format to date
#' @param x Input variable
#' @return Date variable of class Date
#' @examples
#' as_ymd("2013-1-1")
#'
#' @export
as_ymd <- function(x)
  {if (is.factor(x)) as.character(x) else x } %>% {sshhr(ymd(.))} %>% as.Date

# http://www.noamross.net/blog/2014/2/10/using-times-and-dates-in-r---presentation-code.html
#' Convert input in year-month-day-hour-minute-second format to date-time
#' @param x Input variable
#' @return Date-time variable of class Date
#' @examples
#' as_ymd_hms("2014-1-1 12:15:01")
#' \dontrun{
#' as_ymd_hms("2014-1-1 12:15:01") %>% as.Date
#' as_ymd_hms("2014-1-1 12:15:01") %>% month
#' as_ymd_hms("2014-1-1 12:15:01") %>% hour
#' }
#' @export
as_ymd_hms <- function(x)
 {if (is.factor(x)) as.character(x) else x} %>% {sshhr(ymd_hms(.))}

#' Convert input in year-month-day-hour-minute format to date-time
#' @param x Input variable
#' @return Date-time variable of class Date
#' @examples
#' as_ymd_hm("2014-1-1 12:15")
#' @export
as_ymd_hm <- function(x) {
  {if (is.factor(x)) as.character(x) else x} %>%
    {sshhr(parse_date_time(., "%Y%m%d %H%M"))}
}

#' Convert input in month-day-year-hour-minute-second format to date-time
#' @param x Input variable
#' @return Date-time variable of class Date
#' @examples
#' as_mdy_hms("1-1-2014 12:15:01")
#' @export
as_mdy_hms <- function(x) {
  {if (is.factor(x)) as.character(x) else x} %>%
    {sshhr(parse_date_time(., "%m%d%Y %H%M%S"))}
}

#' Convert input in month-day-year-hour-minute format to date-time
#' @param x Input variable
#' @return Date-time variable of class Date
#' @examples
#' as_mdy_hm("1-1-2014 12:15")
#' @export
as_mdy_hm <- function(x) {
  {if (is.factor(x)) as.character(x) else x} %>%
    {sshhr(parse_date_time(., "%m%d%Y %H%M"))}
}

#' Convert input in day-month-year-hour-minute-second format to date-time
#' @param x Input variable
#' @return Date-time variable of class Date
#' @examples
#' as_mdy_hms("1-1-2014 12:15:01")
#' @export
as_dmy_hms <- function(x) {
  {if (is.factor(x)) as.character(x) else x} %>%
    {sshhr(parse_date_time(., "%d%m%Y %H%M%S"))}
}

#' Convert input in day-month-year-hour-minute format to date-time
#' @param x Input variable
#' @return Date-time variable of class Date
#' @examples
#' as_mdy_hm("1-1-2014 12:15")
#' @export
as_dmy_hm <- function(x) {
  {if (is.factor(x)) as.character(x) else x} %>%
    {sshhr(parse_date_time(x, "%d%m%Y %H%M"))}
}

#' Convert input in hour-minute-second format to time
#' @param x Input variable
#' @return Time variable of class Period
#' @examples
#' as_hms("12:45:00")
#' \dontrun{
#' as_hms("12:45:00") %>% hour
#' as_hms("12:45:00") %>% second
#' }
#' @export
as_hms <- function(x)
  {if (is.factor(x)) as.character(x) else x} %>% {sshhr(hms(.))}

#' Convert input in hour-minute format to time
#' @param x Input variable
#' @return Time variable of class Period
#' @examples
#' as_hm("12:45")
#' \dontrun{
#' as_hm("12:45") %>% minute
#' }
#' @export
as_hm <- function(x)
  {if (is.factor(x)) as.character(x) else x} %>% {sshhr(hm(.))}

#' Convert variable to integer avoiding potential issues with factors
#' @param x Input variable
#' @return Integer
#' @examples
#' as_integer(rnorm(10))
#' as_integer(letters)
#' as_integer(as.factor(5:10))
#' as.integer(as.factor(5:10))
#' as_integer(c("a","b"))
#'
#' @export
as_integer <- function(x) {
  if (is.factor(x)) {
    int <- sshhr(levels(x) %>% .[x] %>% as.integer)
    if (length(na.omit(int)) == 0) as.integer(x) else int
  } else if (is.character(x)) {
    int <- sshhr(as.integer(x))
    if (length(na.omit(int)) == 0) as_integer(as.factor(x)) else int
  } else {
    as.integer(x)
  }
}

#' Convert variable to numeric avoiding potential issues with factors
#' @param x Input variable
#' @return Numeric
#' @examples
#' as_numeric(rnorm(10))
#' as_numeric(letters)
#' as_numeric(as.factor(5:10))
#' as.numeric(as.factor(5:10))
#' as_numeric(c("a","b"))
#' as_numeric(c("3","4"))
#'
#' @export
as_numeric <- function(x) {
  if (is.factor(x)) {
    num <- sshhr(levels(x) %>% .[x] %>% as.numeric)
    if (length(na.omit(num)) == 0) as.numeric(x) else num
  } else if (is.character(x)) {
    num <- sshhr(as.numeric(x))
    if (length(na.omit(num)) == 0) as_numeric(as.factor(x)) else num
  } else {
    as.numeric(x)
  }
}

#' Wrapper for factor with ordered = FALSE
#' @param x Input vector
#' @param ordered Order factor levels (TRUE, FALSE)
#' @export
as_factor <- function(x, ordered = FALSE) factor(x, ordered = ordered)

#' Wrapper for as.character
#' @param x Input vector
#' @export
as_character <- function(x) as.character(x)

#' Wrapper for lubridate's as.duration function. Result converted to numeric
#' @param x Time difference
#' @export
as_duration <- function(x) as.numeric(lubridate::as.duration(x))

#' Distance in kilometers or miles between two locations based on lat-long
#' Function based on \url{http://www.movable-type.co.uk/scripts/latlong.html}. Uses the haversine formula
#' @param long1 Longitude of location 1
#' @param lat1 Latitude of location 1
#' @param long2 Longitude of location 2
#' @param lat2 Latitude of location 2
#' @param unit Measure kilometers ("km", default) or miles ("miles")
#' @param R Radius of the earth
#' @return Distance bewteen two points
#' @examples
#' as_distance(32.8245525,-117.0951632, 40.7033127,-73.979681, unit = "km")
#' as_distance(32.8245525,-117.0951632, 40.7033127,-73.979681, unit = "miles")
#'
#' @export
as_distance <- function (lat1, long1, lat2, long2,
                         unit = "km",
                         R = c("km" = 6371, "miles" = 3959)[[unit]]) {

    rad <- pi/180
    d1 <- lat1 * rad
    d2 <- lat2 * rad
    dlat <- (lat2 - lat1) * rad
    dlong <- (long2 - long1) * rad
    a <- sin(dlat/2)^2 + cos(d1) * cos(d2) * sin(dlong/2)^2
    c <- 2 * atan2(sqrt(a), sqrt(1 - a))
    R * c
}

#' Generate a variable used to selected a training sample
#' @param n Number (or fraction) of observations to label as training
#' @param nr Number of rows in the dataset
#' @param seed Random seed
#' @return 0/1 variables for filtering
#' @examples
#' make_train(.5, 10)
#'
#' @export
make_train <- function(n = .7, nr = 100, seed = 1234) {
  seed %>% gsub("[^0-9]","",.) %>% { if (!is_empty(.)) set.seed(seed) }
  if (n < 1) n <- round(n * nr) %>% max(1)
  ind <- seq_len(nr)
  training <- rep_len(0L,nr)
  training[sample(ind,n)] <- 1L
  training
}

#' Add tranformed variables to a data frame (NSE)
#'
#' @details Wrapper for dplyr::mutate_at that allows custom variable name extensions
#'
#' @param .tbl Data frame to add transformed variables to
#' @param .funs Function(s) to apply (e.g., funs(log))
#' @param ... Variables to transform
#' @param .ext Extension to add for each variable
#'
#' @examples
#' mutate_ext(mtcars, funs(log), mpg, cyl, .ext = "_log")
#' mutate_ext(mtcars, funs(log), .ext = "_log")
#'
#' @importFrom pryr named_dots
#'
#' @export
mutate_ext <- function(.tbl, .funs, ..., .ext = "") {

  if (is_empty(.ext)) {
    dplyr::mutate_at(.tbl, .cols = vars(...), .funs = funs)
  } else {
    vars <- pryr::named_dots(...) %>% names
    if (is.null(vars)) vars <- colnames(.tbl)

    new <- paste0(vars, .ext)
    .tbl[,new] <-
      mutate_at(.tbl, .cols = vars, .funs = .funs) %>% select_(.dots = vars) %>%
      set_colnames(new)
    .tbl
  }
}

#' Temporary fix for mutate_if when the predicate is false for all columns
#'
#' @details See https://github.com/tidyverse/dplyr/issues/2617
#'
#' @param .tbl Data frame
#' @param .predicate Predicate
#' @param .funs Function(s) to apply (e.g., funs(log))
#' @param ... Additional arguments
#'
#' @export
mutate_if_tmp <- function (.tbl, .predicate, .funs, ...) {
  if (sum(sapply(.tbl, .predicate)) > 0) {
    rn <- rownames(.tbl)
    cn <- colnames(.tbl)
    colnames(.tbl) <- make.names(cn)
    mutate_if(.tbl, .predicate, .funs, ...) %>%
      set_colnames(cn) %>%
      as.data.frame %>%
      set_rownames(rn)
  } else {
    .tbl
  }
}

#' Create a quintile (or decile) index
#'
#' @details Same as stata
#'
#' @param x Numeric variable
#' @param n number of bins to create
#' @param rev Reverse the order of the xtiles
#'
#' @examples
#' xtile(1:10,5)
#' xtile(1:10,5, rev = TRUE)
#'
#' @export
xtile <- function(x, n, rev = FALSE) {
  stopifnot(is.numeric(n), is.numeric(x), n > 1, length(x) > n)
  breaks <- quantile(x, prob = seq(0, 1, length = n+1), type = 2)
  if (length(breaks) < 2) stop(paste("Insufficient variation in x to construct",n,"breaks"))
  .bincode(x, breaks, include.lowest = TRUE) %>%
  { if (rev) as.integer((n+1) - .) else .}
}

#' Show all rows with duplicated values (not just the first or last)
#'
#' @details If an entire row is duplicated use "duplicated" to show only one of the duplicated rows. When using a subset of variables to establish uniqueness it may be of interest to show all rows that have (some) duplicate elements
#'
#' @param tbl Data frame to add transformed variables to
#' @param ... Variables used to evaluate row uniqueness
#'
#' @examples
#' bind_rows(mtcars, mtcars[c(1,5,7),]) %>%
#'   show_duplicated(mpg, cyl)
#' bind_rows(mtcars, mtcars[c(1,5,7),]) %>%
#'   show_duplicated
#'
#' @importFrom pryr named_dots
#'
#' @export
show_duplicated <- function(tbl, ...) {
  vars <- pryr::named_dots(...) %>% names
  if (is.null(vars) || length(unique(vars)) == ncol(tbl)) {
    filter(tbl, duplicated(tbl))
  } else {
    tbl %>% group_by_(.dots = vars) %>%
      filter(n() > 1) %>%
      mutate(nr_dup = 1:n()) %>%
      arrange_(.dots = vars) %>%
      ungroup
  }
}

#' Weighted standard deviation
#'
#' @details Calculated a weighted standard deviation
#'
#' @param x Numeric vector
#' @param wt Numeric vector of weights
#' @param na.rm Remove missing values (default is TRUE)
#'
#' @export
weighted.sd <- function(x, wt, na.rm = TRUE) {
  if (na.rm) {
    x <- na.omit(x)
    wt <- na.omit(wt)
  }
  wt <- wt/sum(wt)
  wm <- weighted.mean(x, wt)
  sqrt(sum(wt * (x - wm)^2))
}

#' Create data.frame summary
#'
#' @details Used in Radiant's Data > Transform tab
#'
#' @param dat Data.frame
#' @param dc Class for each variable
#'
#' @export
getsummary <- function(dat, dc = getclass(dat)) {

  isFct <- "factor" == dc
  isNum <- "numeric" == dc | "integer" == dc | "Duration" == dc
  isDate <- "date" == dc
  isChar <- "character" == dc
  isLogic <- "logical" == dc
  isPeriod <- "period" == dc

  if (sum(isNum) > 0) {

    cn <- names(dc)[isNum]

    cat("Summarize numeric variables:\n")
    select(dat, which(isNum)) %>%
      tidyr::gather_("variable", "values", cn, factor_key = TRUE) %>%
      group_by_("variable") %>%
      summarise_all(funs(n = length, n_missing = n_missing, n_distinct = n_distinct,
                     mean = mean_rm, median = median_rm, min = min_rm, max = max_rm,
                     `25%` = p25, `75%` = p75, sd = sd_rm, se = se)) %>%
      data.frame(check.names = FALSE) %>%
      ## can't use mutate_if here due to https://github.com/tidyverse/dplyr/issues/2243
      # mutate_if_tmp(is.numeric, funs(round(., 3))) %>%
      mutate_all(funs(if (is.numeric(.)) round(., 3) else .)) %>%
      set_colnames(c("", colnames(.)[-1])) %>%
      print(row.names = FALSE)
    cat("\n")
  }

  if (sum(isFct) > 0) {
    cat("Summarize factors:\n")
    select(dat, which(isFct)) %>% summary(maxsum = 20) %>% print
    cat("\n")
  }

  if (sum(isDate) > 0) {
    cat("Earliest dates:\n")
    select(dat, which(isDate)) %>% summarise_all(funs(min)) %>% as.data.frame %>% print(., row.names = FALSE)
    cat("\nFinal dates:\n")
    select(dat, which(isDate)) %>% summarise_all(funs(max)) %>% as.data.frame %>% print(., row.names = FALSE)
    cat("\n")
  }

  if (sum(isPeriod) > 0) {
    max_time <- function(x) sort(x) %>% tail(1)
    min_time <- function(x) sort(x) %>% head(1)

    cat("Earliest time:\n")
    select(dat, which(isPeriod)) %>% summarise_all(funs(min_time)) %>% as.data.frame %>% print(., row.names = FALSE)
    cat("\nFinal time:\n")
    select(dat, which(isPeriod)) %>% summarise_all(funs(max_time)) %>% as.data.frame %>% print(., row.names = FALSE)
    cat("\n")
  }

  if (sum(isChar) > 0) {
    ## finding unique elements can be slow for large files
    if (nrow(dat) < 10^5) {
      cat("Summarize character variables (< 20 unique values shown):\n")
      select(dat, which(isChar)) %>% lapply(unique) %>%
        {for(i in names(.)) cat(i, paste0("(n_distinct ", length(.[[i]]), "): "), .[[i]][1:min(20,length(.[[i]]))], "\n")}
    } else {
      cat("Summarize character variables (< 20 values shown):\n")
      select(dat, which(isChar)) %>%
        {for(i in names(.)) cat(i, ":", .[[i]][1:min(20,length(.[[i]]))], "\n")}
    }
    cat("\n")
  }
  if (sum(isLogic) > 0) {
    cat("Summarize logical variables:\n")
    select(dat, which(isLogic)) %>% summarise_all(funs(sum_rm, mean_rm, n_missing)) %>%
      mutate_if_tmp(is.numeric, funs(round(., 4))) %>%
      matrix(ncol = 3) %>%
      data.frame %>%
      set_colnames(c("# TRUE", "% TRUE", "n_missing")) %>%
      set_rownames(names(dat)[isLogic]) %>%
      print
    cat("\n")
  }
}

#' Create data.frame from a table
#'
#' @param dat Data.frame
#' @param freq Column name with frequency information
#'
#' @examples
#' data.frame(price = c("$200","$300"), sale = c(10, 2)) %>% table2data
#'
#' @export
table2data <- function(dat, freq = tail(colnames(dat),1)) {
  blowup <- function(i)
    if (!is.na(dat[[freq]][i])) dat[rep(i, each = dat[[freq]][i]), ]

  lapply(1:nrow(dat), blowup) %>%
  bind_rows %>%
  select_(paste0("-",freq)) %>%
  mutate_all(funs(as.factor))
}

#' Generate list of levels and unique values
#'
#' @param dat A data.frame
#' @param ... Unquoted variable names to evaluate
#'
#' @examples
#' data.frame(a = c(rep("a",5),rep("b",5)), b = c(rep(1,5),6:10)) %>% level_list
#' level_list(mtcars, mpg, cyl)
#'
#' @importFrom pryr named_dots
#'
#' @export
level_list <- function(dat, ...) {
  fl <- function(x) {
    cx <- class(x)[1]
    if (cx == "factor") {
      levels(x)
    } else {
      unique(x)
    }
  }
  dots <- pryr::named_dots(...) %>% names
  if (length(dots) > 0) {
    lapply(select_(dat, .dots = dots), fl)
  } else {
    lapply(dat, fl)
  }
}


#' Add ordered argument to lubridate::month
#' @param x Input date vector
#' @param label Month as label (TRUE, FALSE)
#' @param abbr Abbreviate label (TRUE, FALSE)
#' @param ordered Order factor (TRUE, FALSE)
#'
#' @importFrom lubridate month
#'
#' @seealso See the \code{\link[lubridate]{month}} function in the lubridate package for additional details
#'
#' @export
month <- function(x, label = FALSE, abbr = TRUE, ordered = FALSE) {
  x <- lubridate::month(x, label = label, abbr = abbr)
  if (!ordered && label) x <- factor(x, ordered = FALSE)
  x
}

#' Add ordered argument to lubridate::wday
#' @param x Input date vector
#' @param label Weekday as label (TRUE, FALSE)
#' @param abbr Abbreviate label (TRUE, FALSE)
#' @param ordered Order factor (TRUE, FALSE)
#'
#' @importFrom lubridate wday
#'
#' @seealso See the \code{\link[lubridate]{wday}} function in the lubridate package for additional details
#'
#' @export
wday <- function(x, label = FALSE, abbr = TRUE, ordered = FALSE) {
  x <- lubridate::wday(x, label = label, abbr = abbr)
  if (!ordered && label) x <- factor(x, ordered = FALSE)
  x
}

#' Remove/reorder levels
#' @details Keep only a specific set of levels in a factor. By removing levels the base for comparison in, e.g., regression analysis, becomes the first level. To relable the base use, for example, repl = 'other'
#' @param x Character or Factor
#' @param levs Set of levels to use
#' @param repl String (or NA) used to replace missing levels
#'
#' @examples
#' refactor(diamonds$cut, c("Premium","Ideal")) %>% head
#' refactor(diamonds$cut, c("Premium","Ideal"), "Other") %>% head
#'
#' @export
refactor <- function(x, levs = levels(x), repl = NA) {
  if (is.character(x)) {
    lv <- unique(x)
    if (length(levs) == 0) levs <- lv
  } else if (is.factor(x)) {
    lv <- levels(x)
  } else {
    return(x)
  }

  if (length(levs) > 0 && length(lv) > length(levs)) {
    if (!is_empty(repl)) levs <- unique(c(repl, levs))
    x <- as_character(x) %>% ifelse (. %in% setdiff(lv, levs), repl, .)
  }

  factor(x, levels = levs)
}

###############################
## function below not exported
###############################
.recode. <- function(x, cmd) car::Recode(x, cmd)
