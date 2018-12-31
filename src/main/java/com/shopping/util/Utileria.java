package com.shopping.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.DbxException;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.files.FileMetadata;
import com.dropbox.core.v2.files.ListFolderResult;
import com.dropbox.core.v2.files.Metadata;
import com.dropbox.core.v2.files.WriteMode;
import com.dropbox.core.v2.sharing.RequestedVisibility;
import com.dropbox.core.v2.sharing.SharedLinkMetadata;
import com.dropbox.core.v2.sharing.SharedLinkSettings;
import com.dropbox.core.v2.users.FullAccount;

import java.io.InputStream;
import java.io.FileInputStream;

public class Utileria {
	
	private static final String ACCESS_TOKEN = "wGDWpD6_ie4AAAAAAAADyqxgVWv002n0rtDaN0iBw_KqowuT5MdG_XGmr1bRDtYE";

	public static List<String> getNextDays(int count) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		Date start = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, count);
		Date andDate = calendar.getTime();
		
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(start);
		List<String> nextDays = new ArrayList<String>();
		while(!gc.getTime().after(andDate)) {
			Date d = gc.getTime();
			gc.add(Calendar.DATE, 1);
			nextDays.add(sdf.format(d));
		}
		return nextDays;
	}
	
	/*public static String guardarImagen (MultipartFile multiPart, HttpServletRequest request) {
		// Obtenemos el nombre original del archivo
		String nombreOriginal = multiPart.getOriginalFilename();
		nombreOriginal = nombreOriginal.replace(" ", "-");
		String nombreFinal = randomAlphanumeric(18)+nombreOriginal;
		
		// Obtenemos la ruta ABSOLUTA del directorio images
		// apache-tomcat/webapps/cineapp/resources/images/
		String rutaFinal = request.getServletContext().getRealPath("/resources/images/");
		try {
			
			// Formamos el nombre del archivo para guardarlo en el disco duro
			File file = new File(rutaFinal + nombreFinal);
			//System.out.println(file.getAbsolutePath());
			
			// Aqui se guarda fisicamente el archivo en el disco duro
			multiPart.transferTo(file);
			return nombreFinal;
		} catch (IOException e) {
			System.out.println("Error " + e.getMessage());
			return null;
		}
	}*/
	
	public static String guardarImagen (MultipartFile multiPart) {		  
		String url ="";
		try {
			// Create Dropbox client
	        DbxRequestConfig config = new DbxRequestConfig("dropbox/cineapp");
	        DbxClientV2 client = new DbxClientV2(config, ACCESS_TOKEN);
			
	        FullAccount account = client.users().getCurrentAccount();
			System.out.println("Usuario Dropbox: "+account.getName().getDisplayName());
	        System.out.println("Correo de dropbox: " + account.getEmail());
			
			// Get files and folder metadata from Dropbox root directory
	        ListFolderResult result = client.files().listFolder("");
	        while(true) {
	        	for (Metadata metadata : result.getEntries()) {
	        		System.out.println("Name: " + metadata.getPathLower());
	        	}

	            if (!result.getHasMore()) {
	                break;
	            }
	            result = client.files().listFolderContinue(result.getCursor());
	        }
	        
	        // Upload to Dropbox
	        InputStream in = (FileInputStream) multiPart.getInputStream();	        
			String nombreFinal = "/" + multiPart.getOriginalFilename();				

			FileMetadata metadata = client.files()
					.uploadBuilder(nombreFinal)
					.withMode(WriteMode.OVERWRITE)
					.uploadAndFinish(in);

			SharedLinkMetadata slm = client.sharing().createSharedLinkWithSettings(nombreFinal, SharedLinkSettings.newBuilder().withRequestedVisibility(RequestedVisibility.PUBLIC).build());
			String link = slm.getUrl();
			
	        url = link.replace("https://www.dropbox.com", "https://dl.dropboxusercontent.com");        
			
		}catch (DbxException e) {
			System.out.println("Error DROPBOX: " + e.getMessage());
		} catch (IOException e) {
			System.out.println("Error IO: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
		
		System.out.println("URL: " + url);  
		return url;
	}
	
	
	public static String getNameImage(MultipartFile multiPart) {
		return multiPart.getOriginalFilename();
	}
	
    public static void borrarImagen(String name)
    {
        try{
        	DbxRequestConfig config = new DbxRequestConfig("dropbox/cineapp");
 	        DbxClientV2 client = new DbxClientV2(config, ACCESS_TOKEN);
            //DeleteResult metadata = client.files().deleteV2(name);
            Metadata metadata = client.files().delete(name);
        }catch (DbxException dbxe){
            dbxe.printStackTrace();
        }
    }
	
	
	public static String randomAlphanumeric (int count) {
		String CARACTERES = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		StringBuilder builder = new StringBuilder();
		while(count != 0) {
			int character = (int) (Math.random() * CARACTERES.length());
			builder.append(CARACTERES.charAt(character));
			count --;
		}
		return builder.toString();
	}
	
}
