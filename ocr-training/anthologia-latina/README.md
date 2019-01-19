Anthologia Latina Training Data
===============================

52 pages or so from [Archive.org](https://archive.org/details/bub_gb_YacNAAAAIAAJ) without the critical apparatus.

## Process

Initial ground truth was generated through Tesseract then converted using an ad-hoc [XSL converting hOCR to Kraken correction environment](https://gist.github.com/PonteIneptique/c866c3387f7a5709dbd17b86123b37c5).

## Extract ground truth

Install [Kraken](http://kraken.re) ([Github](https://github.com/mittagessen/kraken)) and then type

```shell
ketos extract pages/*.html -o extract -u NFD -s
```
## Characters count

Characters count were produce with

```shell
sed 's/\(.\)/\1\n/g' extract/*.txt | sort | uniq -c | sort -k 2 > characters.with_case.txt
sed 's/\(.\)/\1\n/g' extract/*.txt | sort | uniq -ic | sort -k 2 > characters.txt
```