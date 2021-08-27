package br.ufu.kaiosouza;

import br.ufu.kaiosouza.managers.ItemManager;
import br.ufu.kaiosouza.models.CD;
import br.ufu.kaiosouza.models.DVD;
import br.ufu.kaiosouza.models.VHS;

import java.math.BigDecimal;
import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        ItemManager itemManager = new ItemManager();

        itemManager.getCds()[0] = new CD("BANDA DEJAVU", "tecno", 2000, 50, new BigDecimal("12.50"), "DJ JUNINHO PORTUGAL", 8);
        itemManager.getCds()[1] = new CD("JORGIN", "sertanejo", 2008, 50, new BigDecimal("18.50"), "Jorge e Matheus", 8);

        itemManager.getDvds()[0] = new DVD("De volta pro futuro I", "ficção", 1985, 28, new BigDecimal("25.90"), Arrays.asList("Martin McFly",
                "Doctor Brown"), "Robert Zemeckis", 180, 14);
        itemManager.getDvds()[1] = new DVD("De volta pro futuro II", "ficção", 1988, 23, new BigDecimal("25.90"), Arrays.asList("Martin McFly",
                "Doctor Brown"), "Robert Zemeckis", 180, 14);

        itemManager.getVhss()[0] = new VHS("Titanic", "romance", 1997, 57, new BigDecimal("18.90"), Arrays.asList("Kate Winslet", "Leonardo DiCaprio"),
                "James Cameron", 210, 16);
        itemManager.getVhss()[1] = new VHS("Titanic II", "romance", 1997, 57, new BigDecimal("18.90"), Arrays.asList("Kate Winslet", "Leonardo DiCaprio"),
                "James Cameron", 210, 16);
    }
}
