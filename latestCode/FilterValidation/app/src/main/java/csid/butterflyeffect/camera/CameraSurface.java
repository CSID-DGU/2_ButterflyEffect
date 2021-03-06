package csid.butterflyeffect.camera;

/**
 * Created by hanseungbeom on 2018. 1. 15..
 */
import android.content.Context;
import android.hardware.Camera;
import android.util.AttributeSet;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import csid.butterflyeffect.util.Constants;

import static android.hardware.Camera.CameraInfo.CAMERA_FACING_FRONT;

public class CameraSurface extends SurfaceView implements SurfaceHolder.Callback {
    private static final String TAG = "CameraSurface:";
    public Camera camera;
    protected SurfaceHolder holder = getHolder();
    private boolean previewing = false;

    public CameraSurface(Context paramContext, AttributeSet paramAttributeSet) {
        super(paramContext, paramAttributeSet);
        holder.setType(3);
        holder.addCallback(this);
        setKeepScreenOn(true);
    }

    private void setPreferredFormat(Camera.Parameters paramParameters,
                                    int paramInt) {
        Iterator<Integer> localIterator = paramParameters
                .getSupportedPreviewFormats().iterator();
        while (true) {
            if (!localIterator.hasNext())
                return;
            if (((Integer) localIterator.next()).intValue() == paramInt) {
                paramParameters.setPreviewFormat(paramInt);
            }
        }
    }

    private void setPreferredSize(Camera.Parameters paramParameters,
                                  int paramInt1, int paramInt2) {
        Iterator localIterator = paramParameters.getSupportedPreviewSizes()
                .iterator();
        while (true) {
            if (!localIterator.hasNext())
                return;
            Camera.Size localSize = (Camera.Size) localIterator.next();
            if ((localSize.width == paramInt1)
                    && (localSize.height == paramInt2))
                paramParameters.setPreviewSize(paramInt1, paramInt2);
        }
    }

    public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1,
                               int paramInt2, int paramInt3) {
        if (camera == null)
            return;
        if (previewing)
            camera.stopPreview();
        Camera.Parameters localParameters = camera.getParameters();

        //search device available size.
        List<Camera.Size> sizeList = localParameters.getSupportedPreviewSizes();
        for(int i = 0; i < sizeList.size(); i++){
            Log.d("DEBUG", "width: "+sizeList.get(i).width+", height: "+sizeList.get(i).height);
        }
        Camera.Size bestSize = sizeList.get((sizeList.size()-1)-sizeList.size()/7); // 9/10 index.
        Log.d("DEBUG", "best width: "+bestSize.width+", best height: "+bestSize.height);
        //setting middle of available size.
        localParameters.setPreviewSize(bestSize.width, bestSize.height);
        localParameters.setPreviewFpsRange(15000, 15000);

        setPreferredSize(localParameters, paramInt2, paramInt3);
        setPreferredFormat(localParameters, paramInt1);

        camera.setParameters(localParameters);
        camera.startPreview();
        previewing = true;
    }

    public void surfaceCreated(SurfaceHolder paramSurfaceHolder) {
        try {
            camera = Camera.open(CAMERA_FACING_FRONT);
            camera.setPreviewDisplay(paramSurfaceHolder);
            return;
        } catch (IOException localIOException) {
            Log.e("CameraSurface", "Error setting preview display.");
            camera.release();
            camera = null;
        }
    }

    public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder) {
        if (camera != null) {
            if (previewing) {
                camera.stopPreview();
            }
            previewing = false;
            camera.release();
            camera = null;
        }
    }
    public void refreshFocus(){
        Camera.Parameters params = camera.getParameters();
        params.setFocusMode(Camera.Parameters.FOCUS_MODE_CONTINUOUS_PICTURE);
        camera.setParameters(params);
    }
}