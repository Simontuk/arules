\name{itemsets-class}
\docType{class}
\alias{itemsets-class}
\alias{itemsets}
\alias{summary.itemsets-class}
\alias{show,summary.itemsets-method}
%\alias{[,itemsets-method}
\alias{coerce,itemsets,data.frame-method}
\alias{items,itemsets-method}
\alias{items<-,itemsets-method}
\alias{items}
\alias{items<-}
\alias{itemInfo,itemsets-method}
\alias{itemLabels,itemsets-method}
\alias{labels,itemsets-method}
\alias{itemLabels,itemsets-method}
%\alias{length,itemsets-method}
%\alias{subset,itemsets-method}
\alias{summary,itemsets-method}
\alias{tidLists,itemsets-method}
%\alias{tidLists}

\title{Class itemsets --- A Set of Itemsets}
\description{
  The \code{itemsets} class represents a set of itemsets and the associated
  quality measures. 
  
  Note that the class can also represent a multiset of itemsets with duplicated
  elements. Duplicated elements can be removed with \code{\link{unique}}.
}
\section{Objects from the Class}{
  Objects are the result of calling the functions \code{\link{apriori}}
  (e.g., with \code{target="frequent itemsets"} in the parameter list) 
  or \code{\link{eclat}}.
  Objects can also be created by calls of the form
  \code{new("itemsets", ...)}. 
}
\section{Slots}{
  \describe{
    \item{\code{items}:}{object of class
      \code{\linkS4class{itemMatrix}} containing the 
      items in the set of itemsets}
    \item{\code{quality}:}{a data.frame
      containing the quality measures for the itemsets}
    \item{\code{tidLists}:}{object of class
      \code{\linkS4class{tidLists}} containing the IDs of the
      transactions which support each itemset.  The slot contains
      \code{NULL} if no transactions ID list is available (transactions
      ID lists are only available for \code{\link{eclat}}).
    }
  }
}
\section{Extends}{
  Class \code{\linkS4class{associations}}, directly.
}
\section{Methods}{
  \describe{
    \item{coerce}{\code{signature(from = "itemsets", to =
	"data.frame")};
      represent the itemsets in readable form}
    \item{items}{\code{signature(x = "itemsets")};
      returns the \code{\linkS4class{itemMatrix}}
      representing the set of itemsets}
    \item{items<-}{\code{signature(x = "itemsets")};
      replaces the \code{\linkS4class{itemMatrix}}
      representing the set of itemsets}
    \item{itemInfo}{\code{signature(object = "itemsets")}; 
      returns the whole	item information data frame including item
      labels}
%    \item{itemLabels}{\code{signature(object = "itemsets")}; 
%      returns the item labels used to encode the itemsets.}
    \item{labels}{\code{signature(object = "itemsets")};
      returns labels for the itemsets as a
      character vector. The labels have te following format: 
	"{item1, item2,..., itemn}"}
   \item{itemLabels}{\code{signature(object = "itemsets")};
      returns the item labels used to encode the itemsets as
      a character vector. The index for each label is the column
      index of the item in the binary matrix.}
    \item{summary}{\code{signature(object = "itemsets")}}
    \item{tidLists}{\code{signature(object = "itemsets")};
      returns the transaction ID list}
  }
}
\seealso{
  \code{\link{[-methods}},
  \code{\link{apriori}},
  \code{\link{c}},
  \code{\link{duplicated}},
  \code{\link{eclat}},
  \code{\link{inspect}},
  \code{\link{is.maximal}},
  \code{\link{length}},
  \code{\link{match}},
  \code{\link{sets}},
  \code{\link{size}},
  \code{\link{subset}},
  \code{\link{associations-class}}, 
  \code{\link{tidLists-class}} 
}
\author{Michael Hahsler}
\examples{
data("Adult")

## Mine frequent itemsets with Eclat.
fsets <- eclat(Adult, parameter = list(supp = 0.5))

## Display the 5 itemsets with the highest support.
fsets.top5 <- sort(fsets)[1:5]
inspect(fsets.top5)

## Get the itemsets as a list
as(items(fsets.top5), "list")

## Get the itemsets as a binary matrix
as(items(fsets.top5), "matrix")

## Get the itemsets as a sparse matrix, a ngCMatrix from package Matrix.
## Warning: for efficiency reasons, the ngCMatrix you get is transposed 
as(items(fsets.top5), "ngCMatrix")

}
\keyword{classes}
