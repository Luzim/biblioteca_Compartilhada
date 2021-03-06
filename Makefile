MAINNAME	:=	main
OBJDIR      := biblioteca
INCLUDE_DIR := include
LIB_NAME    := operacoes
LIB_VERSION := 1

dinamico:	install	main 
estatico:	estatic	main

#----	---------------object--------------------------------
object:
	gcc	-c	$(OBJDIR)/*.c	-fPIC
	cp	*.o	$(OBJDIR)
	rm	-f	*.o
#--------------estatic--------------------------------------
estatic:	object
	ar	-crs	$(OBJDIR)/lib$(LIB_NAME).a	$(OBJDIR)/aceleracao.o	$(OBJDIR)/deslocamento.o	$(OBJDIR)/eqT.o	$(OBJDIR)/velocidade_Media.o
#--------------dinamic-------------------------------------
dinamic:	object
	gcc	-shared	-o	$(OBJDIR)/lib$(LIB_NAME).so.01	$(OBJDIR)/aceleracao.o	$(OBJDIR)/deslocamento.o	$(OBJDIR)/eqT.o	$(OBJDIR)/velocidade_Media.o
	ln	-s	lib$(LIB_NAME).so.01	$(OBJDIR)/lib$(LIB_NAME).so
#--------------main----------------------------------------
main:
	gcc	-c	$(MAINNAME).c
	gcc	-o	$(MAINNAME)	$(MAINNAME).o	-L$(OBJDIR)	-l$(LIB_NAME)

#-------------install--------------------------------------
install:	dinamic

	sudo	cp	$(OBJDIR)/lib$(LIB_NAME).so.01	/usr/lib
	sudo	cp	$(OBJDIR)/lib$(LIB_NAME).so		/usr/lib
	sudo	cp	$(OBJDIR)/tudo.h	/usr/include

#-------------clean----------------------------------------
clean:
	rm	-f	$(OBJDIR)/*.o
	rm	-f	$(MAINNAME).o
	rm	-f	$(MAINNAME)
	rm	-f	$(OBJDIR)/*.a
	rm	-f	$(OBJDIR)/*.so
	rm	-f	$(OBJDIR)/*.so.01
