package snippets;

import java.util.Random;

public class GenerarDatos {
    private GenerarDatos(){}
    public static int generarNumeroMascota(){
        return new Random().nextInt(10000-100)+100;
    }
}
