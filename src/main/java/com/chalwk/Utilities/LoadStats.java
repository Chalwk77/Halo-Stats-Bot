package com.chalwk.Utilities;

import org.json.JSONObject;

import java.io.IOException;

import static com.chalwk.Utilities.FileIO.loadJSONObject;

public class LoadStats {
    public static JSONObject loadStats(String path) throws IOException {
        return loadJSONObject(path);
    }
}
