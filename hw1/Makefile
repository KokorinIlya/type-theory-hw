.PHONY: pack all run clean
GENERATED=src/parser.mli src/parser.ml src/lexer.ml
OCAMLC=ocamlopt # ocamlopt for speed
PACKAGE=hw1.zip

ifeq ($(OS),Windows_NT)
	DEL=del /f
else
	DEL=rm -f
endif

all: main.exe

run:
	./main.exe

src/lambda.cmi:
	cd src && $(OCAMLC) -c lambda.ml

main.exe: $(GENERATED) src/lambda.cmi
	cd src && $(OCAMLC) lambda.ml $(GENERATED:src/%=%) utils.ml io.ml main.ml -o ../main.exe

pack: $(GENERATED)
	zip $(PACKAGE) -r Makefile src

$(GENERATED): src/lexer.mll src/parser.mly
	ocamllex src/lexer.mll 
	ocamlyacc src/parser.mly

clean:
	cd src && $(DEL) $(GENERATED:src/%=%) *.c* *.o*
	$(DEL) main.exe $(PACKAGE)

