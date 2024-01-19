import android.app.Application;

import com.yandex.mapkit.MapKitFactory;

public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
            MapKitFactory.setApiKey("aeb98243-65a8-4375-a955-759e653b7f8c"); 
    }
}