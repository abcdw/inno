import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.Scanner;

public class EvenCheck {

    public static void main(String[] args) {
        try {
            FileOutputStream out = new FileOutputStream("numbers.out");
            System.setOut(new PrintStream(out));
            Scanner sc = new Scanner(new File("numbers.in"));

            while (sc.hasNext()) {
                String str = sc.next();
                try {
                    Long number = Long.parseLong(str);
                    if ((number & 1) == 0)
                        System.out.print("even ");
                    else
                        System.out.print("odd ");
                } catch(Exception e) {
                    System.out.print("nan ");
                }
            }

            sc.close();
            out.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
