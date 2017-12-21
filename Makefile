.PHONY: all clean copy verksamhetsplaner reglemente policies stadga mallar flashit 8-bit ordlista hedersmedlemmar

# Note: the $< variable is the 1st "argument" to the target while
# $@ is the target.
#
# The output directory, relative to the Makefile
builddir=build
# The base command that should be run. Note that you can override -outdir
# in the individual targets.
latexmk=latexmk -outdir=$(builddir)/$@ -f -quiet -silent -pdf -xelatex -use-make-
# The dir that the finished pdfs should be copied into. Relative to this filek
copydir=../

all: verksamhetsplaner reglemente policies stadga mallar flashit 8-bit ordlista hedersmedlemmar

verksamhetsplaner: verksamhetsplaner/
	$(latexmk) $<styrit14.tex
	# Example of -outdir override
	#$(latexmk) -outdir=$(builddir)/$@/styrit_override $<styrit.tex

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

flashit: flashit/flashit_stadga.tex
	$(latexmk) $<

8-bit: 8-bit/8-bit_stadga.tex
	$(latexmk) $<

mallar: mallar/
	$(latexmk) $<askningsmall/askningsmall.tex
	$(latexmk) $<motionsmall/motionsmall.tex
	$(latexmk) $<intygsmall/intygsmall.tex
	$(latexmk) $<deltagarlista/deltagarlista.tex
	$(latexmk) $<hedersmedlemsmall/hedersmedlemsmall.tex
	$(latexmk) $<beslutsmall/beslutsmall.tex
	$(latexmk) $<namnlista/namnlista.tex
	$(latexmk) $<nomineringsmall/nomineringsmall.tex

hedersmedlemmar: hedersmedlemmar/
	$(latexmk) $<anette.tex
	$(latexmk) $<wolfgang.tex

ordlista: ordlista.tex
	$(latexmk) $<

copy:
	rsync -a $(builddir)/ $(copydir) --include "*.pdf" --include "*/" --exclude "*"

clean:
	find $(builddir) ! -name "*.pdf" -type f -delete
