% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BNP_PerState.R
\name{perturbState}
\alias{perturbState}
\title{Perturb network state or trajectory.}
\usage{
perturbState(net, state, genes, time = 1, result = c("attractor",
  "nextState", "trajectory"), all.data = F, int = F, ...)
}
\arguments{
\item{net}{BoolNet network to perturb}

\item{state}{state to perturb, default is a random state.}

\item{genes}{genes to perturb, default is a random gene.}

\item{time}{time of perturbation, default is 1. If time=NULL the perturbation will be fixed permanently, if time=n the perturbation will last n time steps and then the rules will return to their original values.}

\item{result}{select 'attractor','nextState','trajectory'}

\item{all.data}{returns list with initial state, perturb node, and result. states will be simplified as integer or string with sep='/' for cycles}

\item{int}{return attractor as int with sep="/"}

\item{...}{Further parameters to \code{\link{stateTransition}} and \code{\link{getAttractors}}.}

\item{values}{value of perturbed genes, default is bitflip of target genes.}
}
\value{
If result='attractor' returns the attractor the state reached after the perturbation
        if result=''nextState' returns the next state reached after the perturbation
        if result='trajectory' return the trajectory after perturbation (only synchronous update)
}
\description{
Modifies the values of a state and returns the resulting attractor or trajectory. If time=NULL the perturbation will be fixed permanently, if time=n the perturbation will last n time steps and then the rules will return to their original values.
}
\examples{
# Perturb two nodes of a state for one time step, return attractor object
> perturbState(cellcycle, 162, c('CycD', 'Rb'))
 |--<---------|
 V            |
 0100010100   |
 V            |
 |-->---------|

# Perturb two nodes of a state for one time step, return nextState
> perturbState(cellcycle, 162, c('CycD', 'Rb'), result='nextState')
  CycD     Rb    E2F   CycE   CycA    p27  Cdc20   Cdh1 UbcH10   CycB 
     0      0      1      0      0      0      0      1      0      0 

# Perturb an state by permanetly fixing the value of nodes, return the trajectory
> perturbState(cellcycle, 162, c('CycD', 'Rb'), result = 'trajectory')
  CycD Rb E2F CycE CycA p27 Cdc20 Cdh1 UbcH10 CycB
1    0  1   0    0    0   1     0    1      0    0
2    1  0   0    0    0   1     0    1      0    0
3    0  0   1    0    0   0     0    1      0    0
4    0  1   1    1    1   1     0    1      0    0
5    0  1   0    0    0   0     0    1      0    0
6    0  1   0    0    0   1     0    1      0    0

# Perturb random node for 3 time steps
perturbState(cellcycle, time=3)

Modify state, set new value to target nodes.
}
\seealso{
\code{\link{stateTransition}}, \code{\link{getAttractors}}, \code{\link{perturbTrajectories}}
}
