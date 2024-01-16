package curso.es;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class AppTest {

    @Test
    public void sumarNumerosTest() {
        App miApp = new App();
        int numero1 = 5;
        int numero2 = 10;
        int resultado = miApp.sumarNumeros(numero1, numero2);
        int resultadoEsperado = 15;
        assertEquals( resultadoEsperado, resultado );
    }
}
