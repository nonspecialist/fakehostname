import java.net.*;

public class HostnameApp {
    public static void main(String[] args) {
        try {
            InetAddress addr = InetAddress.getLocalHost();

            // Get IP Address
            byte[] ipAddr = addr.getAddress();

            // Get hostname
            String hostname = addr.getHostName();

            System.out.println("Hostname: " + hostname);
        } catch (UnknownHostException e) {
            System.out.println("Exception: " + e);
        }
    }
}

// vim:ts=4 sw=4 expandtab:
