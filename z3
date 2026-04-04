interface Drive {
    void drive();
}
interface Carry {
    void carry();
}

abstract class Car {
    protected String name;
    protected int speed;
    static int count = 0;
    public Car(String name, int speed) {
        this.name = name;
        this.speed = speed;
        count++;
    }

    public void info() {
        System.out.println(name + " " + speed);
    }

    public static void showCount() {
        System.out.println("Машин: " + count);
    }

    public abstract void move();
}

class LightCar extends Car implements Drive {
    private int fuel;
    public LightCar(String name, int speed, int fuel) {
        super(name, speed);
        this.fuel = fuel;
    }

    public void drive() {
        if (fuel > 0) {
            fuel--;
            System.out.println("Едем");
        } else {
            System.out.println("Нет топлива");
        }
    }

    public void move() {
        System.out.println("Легковая едет");
    }
}

class Truck extends Car implements Carry {
    private int load;
    private int max;
    public Truck(String name, int speed, int max) {
        super(name, speed);
        this.max = max;
        this.load = 0;
    }
    public void carry() {
        if (load < max) {
            load += 10;
            System.out.println("Груз добавлен");
        } else {
            System.out.println("Перегруз");
        }
    }

    public void move() {
        System.out.println("Грузовик едет");
    }
}
public class Main {
    public static void main(String[] args) {
        LightCar c = new LightCar("BMW", 100, 2);
        Truck t = new Truck("MAN", 80, 50);

        c.info();
        c.drive();

        t.info();
        t.carry();

        Car.showCount();
    }
}
