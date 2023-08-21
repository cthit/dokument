# Dokument

Dokument tillhörande Teknologsektionen Informationsteknik på Chalmers tekniska högskola. Det inkluderar bl.a. styrdokument och riktlinjer.

De publicerade dokumenten kan hittas på https://docs.chalmers.it/. Nya ändringar är publiceras automatiskt när de pushas till master-branchen.

## Göra ändringar

För att göra ändringar finns två alternativ:

1. Ladda ner allt och gör det till en ZIP-fil som du sedan laddar in i sharelatex. Gör ändringarna och ladda ner det nya och pusha det till github.
2. Kör det lokalt genom att skriva "make", se till att du har latex installerat lokalt.

**OBS!**
Dessa dokument behöver också kompileras med XeTeX kompilatorn. (I overleaf kan man välja detta genom att klicka på Menu -> Compiler och sedan välja XeTeX i listan.)

### Lägga till nytt dokument

Om du har lagt till ett nytt dokument så måste du lägga till det i Makefile. Detta görs genom att lägga till en rad i Makefile som ser ut som följande. (Detta är för att vi använder oss av latexmk för att kompilera dokumenten. Och lokalt krävs detta.)

```makefile
TYP_AV_DOKUMENT: /VÄG/TILL/DOKUMENT/TYP
	$(latexmk) $<VÄG/FRÅN/TYP/TILL/FIL.tex
  # Om det är det enda dokumentet av denna typ (likt stadga eller reglemente) får du istället skriva:
  $(latexmk) $<
```

Vidare, om du vill att ditt dokument skall läggas till som publicerat måste du gå in i `.github/workflows/build_all.yml` och lägga till följande (på rimlig plats, finns kommentarer som delar upp sektioner):

```yml
DOKUMENT_NAMN: # Får inte innehålla mellanslag, siffror eller specialtecken
  uses: ./.github/workflows/build_document.yml
  with:
    document_name: DOKUMENT_NAMN # Detta är namnet på dokumentet, som blir namnet på pdf-filen
    latex_build_entry: VÄG/TILL/FIL.tex # Detta är sökvägen till latex-filen som skall kompileras
```
