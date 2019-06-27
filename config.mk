LANGUAGE=python
COUNT_SRC=countwords.py
COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)
ZIPF_SRC=testzipf.py
ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)

TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))
PNG_FILES=$(patsubst %.dat, %.png, $(DAT_FILES))

