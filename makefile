# $^ = dependencies of current rule
# $@ = target of current rule
# $< = first dependency of current rule
# % = pattern rule (only allowed in targets & dependencies, not in actions)
# $* = Wildcard (in actions) to replace the stem with which the rule matched
# 'wildcard' gets a list of files matching some pattern, which we can then save in a variable
# @echo = 'make' prints actions as it executes them. Using @ at the start of an action tells 'make' not to print this action. So, by using @echo instead of echo, we can see the result of echo (the variable’s value being printed) but not the echo command itself.
# 'patsubst' = (‘pattern substitution’) takes a pattern, a replacement string and a list of names in that order; each name in the list that matches the pattern is replaced by the replacement string. Again, we can save the result in a variable.

include config.mk

TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))

# Generate summary table
results.txt : $(ZIPF_SRC) $(DAT_FILES)
	$(ZIPF_EXE) $(DAT_FILES) > $@

.PHONY: dats
dats: $(DAT_FILES)

# Count words.
%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $@

.PHONY: clean
clean:
	rm -f $(DAT_FILES)
	rm -f results.txt
	rm -f callgrind*

.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
