package WorkOfTheForms;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;
import javax.servlet.http.Part;

public class FileUploader {

    public static String uploadFile(String location, Part[] p) {

        String fullname = "";
        for (int i = 0; i < 5; i++) {
            if (p[i].getSubmittedFileName().equals("")) {
                continue;
            }

            String str = UUID.randomUUID().toString().replace("-", "");
            String temp = p[i].getSubmittedFileName();
            int j = temp.lastIndexOf(".");
            String extName = temp.substring(j);
            String name = "uploads/" + str + extName;
            String fileName = location + "/" + name;
            try {
                InputStream is = p[i].getInputStream();
                byte[] arr = new byte[(int) p[i].getSize()];
                is.read(arr);
                FileOutputStream fo = new FileOutputStream(fileName);
                fo.write(arr);
                fo.close();
            } catch (Exception ex) {
            }
            fullname = fullname + name + ";";
        }
        return fullname;
    }

}
