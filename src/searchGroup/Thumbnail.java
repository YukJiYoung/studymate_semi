package searchGroup;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class Thumbnail {
    public static void imageCopy(File original){
        try {
            //����� ���λ�����
            int thumbnail_width = 100;
            //����� ���λ�����
            int thumbnail_height = 100;
            //�����̹��������� ���+���ϸ�
            File origin_file_name = original;
            //������ ����������� ���+��������ϸ�
            File thumb_file_name = new File("/filesave/thumbnail_image.jpg");
 
            BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
            BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
            Graphics2D graphic = buffer_thumbnail_image.createGraphics();
            graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
            ImageIO.write(buffer_thumbnail_image, "jpg", thumb_file_name);
            System.out.println("����� �����Ϸ�");
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
        	
        }
    }
}