# Dokument

Dokument tillhörande Teknologsektionen Informationsteknik på Chalmers tekniska högskola. Det inkluderar bl.a. styrdokument och riktlinjer.

De publicerade dokumenten kan hittas på <https://docs.chalmers.it>. Nya ändringar publiceras automatiskt när de pushas till master-branchen.
Sidan är byggd med hjälp av [Astro](https://astro.build/), som är en statisk webbsidesgenerator.
Repot för sidan finns [här](https://github.com/cthit/dokument-site).

## Göra ändringar

Börja med att göra en fork av detta repo. Alla ändringar bör göras genom en pull request som någon annan reviewar.

För att uppdatera dokumenten finns sen flera alternativ:

1. Skapa ett nytt projekt i Overleaf från din fork som är [synkroniserad med GitHub](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/github-synchronization).
2. [Ladda ner allt som en ZIP-fil](https://docs.github.com/en/repositories/working-with-files/using-files/downloading-files-from-github#downloading-a-repositorys-files) som du sedan [skapar ett nytt projekt från i Overleaf](https://docs.overleaf.com/managing-projects-and-files/uploading-a-project). Gör ändringarna, [ladda ner det nya](https://docs.overleaf.com/managing-projects-and-files/downloading-a-project) och pusha till din fork.
3. Bygg dokumenten lokalt genom att köra `make` kommandot. Se till att du har LaTeX installerat lokalt eller kör `nix develop` om du använder Nix.

**OBS!**
Dessa dokument behöver också kompileras med XeTeX kompilatorn. I Overleaf kan man välja detta genom att klicka på **File -> Settings -> Compiler** och sedan välja **XeLaTeX** i listan som **Compiler**.

### Lägga till nytt dokument

Om du har lagt till ett nytt dokument så måste du lägga till det i `Makefile`. Detta görs genom att lägga till en rad i `Makefile` som ser ut som följande. Detta är för att vi använder oss av `latexmk` för att kompilera dokumenten och att det krävs lokalt.

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
