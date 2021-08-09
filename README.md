# Approximating Mutual Information for Multi-label Feature Selection

## Abstract

This work focuses on approximating mutual information for multi-label feature selection. The proposed method selects a feature subset that maximizes dependency to target labels and minimizes inter-dependency among features.

This software is a Matlab implementation of the proposed method, specialized on problems of multi-label feature selection. The original version of this program was written by Jaesung Lee and Hyunki Lim.

### [Paper]

Jaesung Lee, Hyunki Lim, and Dae-Won Kim, [“Approximating Mutual Information for Multi-label Feature Selection,”](http://air.cau.ac.kr/softwares/mlfs2012/lee2012approximating.pdf) Electronics Letters, 2012

## License

This program is available for download for non-commercial use, licensed under the GNU General Public License, which is allows its use for research purposes or other free software projects but does not allow its incorporation into any type of commerical software.

## Sample Input and Output

It will find the index of input categorical features in orders of proposed method. This code can executed under Matlab command window.

### [Usage]:
   `>> index = proposed( data, label, number );`

### [Description]
   data – a matrix that is composed of features \
   label – a matrix that is composed of labels(multi-label) \
   number – the number of features to be selected \
   index – an index of selected features

By convention in the input features matrix, rows represent data(patterns) and columns represent features.
