package com.bean;

//import org.ansj.domain.Result;
//import org.ansj.splitWord.analysis.ToAnalysis;

import java.util.ArrayList;
import java.util.List;

public class ansjSearch {
    public boolean search (String mname, String search) {
        /*Result res1 = ToAnalysis.parse(search),
                res2 = ToAnalysis.parse(mname);
        String obj1 = res1.toString(),
                obj2 = res2.toString();
        for(int i = 0; i < res1.size(); i++) {
            for(int j = 0; j < res2.size(); j++) {
                if(obj1.split(",")[i].equals(obj2.split(",")[j])) {
                    return true;
                }
            }
        }
        return false;*/
        List<String> ch = new ArrayList<>();
        for (int i = 0; i < search.length(); i++) {
            if (search.substring(i, i + 1).matches("[\\u4e00-\\u9fa5]")) {
                ch.add(search.substring(i, i + 1));
            }
        }
        for (int i = 0; i < ch.size(); i++) {
            if(mname.contains(ch.get(i))) {
                return true;
            }
        }
        return false;
    }
}
