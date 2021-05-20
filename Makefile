.PHONY: all clean copy reglemente policies stadga mallar intresseforeningar stoddokument hedersmedlemmar kassorsresurser

# Note: the $< variable is the 1st "argument" to the target while
# $@ is the target.
#
# The output directory, relative to the Makefile
builddir=build
# The base command that should be run. Note that you can override -outdir
# in the individual targets.
latexmk=latexmk -outdir=$(builddir)/$@ -f -pdf -xelatex -use-make-
# The dir that the finished pdfs should be copied into. Relative to this filek
copydir=../

all: reglemente policies stadga mallar intresseforeningar stoddokument hedersmedlemmar kassorsresurser

reglemente: reglemente/reglemente.tex
	$(latexmk) $<

policies: policies/
	$(latexmk) $<ekonomisk_policy/ekonomisk_policy.tex
	$(latexmk) $<lokalpolicy/lokalpolicy.tex
	$(latexmk) $<mjukvarupolicy/mjukvarupolicy.tex
	$(latexmk) $<kommunikationspolicy/kommunikationspolicy.tex
	$(latexmk) $<uppforandepolicy/uppforandepolicy.tex
	$(latexmk) $<miljopolicy/miljopolicy.tex

stadga: stadga/stadga.tex
	$(latexmk) $<

mallar: mallar/
	$(latexmk) $<askningsmall/askningsmall.tex
	$(latexmk) $<motionsmall/motionsmall.tex
	$(latexmk) $<intygsmall/intygsmall.tex
	$(latexmk) $<hedersmedlemsmall/hedersmedlemsmall.tex
	$(latexmk) $<beslutsmall/beslutsmall.tex
	$(latexmk) $<namnlista/namnlista.tex
	$(latexmk) $<nomineringsmall/nomineringsmall.tex

intresseforeningar: intresseforeningar/
	$(latexmk) $<8-bit/8-bit_stadga.tex
	$(latexmk) $<FikIT/FikIT_stadga.tex

stoddokument: stoddokument/
	$(latexmk) $<digital_moteshallning.tex
	$(latexmk) $<ordlista.tex
	$(latexmk) $<sektionsmoteshandbok.tex

hedersmedlemmar: hedersmedlemmar/
	$(latexmk) $<anette.tex
	$(latexmk) $<wolfgang.tex
	$(latexmk) $<samuel.tex

kassorsresurser: kassorsresurser/
	$(latexmk) $<bokforingsmallar.tex
	$(latexmk) $<kassor_101.tex
	$(latexmk) $<kassorskontinuitet_kommitteer.tex

copy:
	cp -n ./build/**/*.pdf ./build/output

clean:
	find $(builddir) ! -name "*.pdf" -type f -delete
