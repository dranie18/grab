package aib.grab_demo;

import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationProvider;
import android.os.Bundle;
import android.util.Log;

import java.util.List;
import java.util.Locale;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private String CHANNEL = "map";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler((methodCall, result) -> {
                switch (methodCall.method){
                    case "location":{
                        double lat = methodCall.argument("lat");
                        double lon = methodCall.argument("long");
//                        getAddress(new Location().);
                        break;
                    }
                }
        });
    }
    private String getAddress(Location location) {
        double lat = location.getLatitude();
        double lng = location.getLongitude();
        String addrs = "";
        Geocoder geocoder = new Geocoder(this, Locale.getDefault());
        try {
            List<Address> addresses = geocoder.getFromLocation(lat, lng, 1);
            if (addresses != null && addresses.size() > 0) {
                Address returnedAddress = addresses.get(0);
                String featureName = returnedAddress.getFeatureName();
                if (featureName != null && !featureName.isEmpty()) {
                    addrs += returnedAddress.getFeatureName() + " ";
                }
                String thoroughfare = returnedAddress.getThoroughfare();
                if (thoroughfare != null && !thoroughfare.isEmpty()) {
                    addrs += returnedAddress.getThoroughfare() + ", ";
                }
                String subAdminArea = returnedAddress.getSubAdminArea();
                if (subAdminArea != null && !subAdminArea.isEmpty()) {
                    addrs += returnedAddress.getSubAdminArea() + ", ";
                }
                String adminArea = returnedAddress.getAdminArea();
                if (adminArea != null && !adminArea.isEmpty()) {
                    addrs += returnedAddress.getAdminArea() + ", ";
                }
                String countryName = returnedAddress.getCountryName();
                if (countryName != null && !countryName.isEmpty()) {
                    addrs += returnedAddress.getCountryName();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return addrs;
    }
}
