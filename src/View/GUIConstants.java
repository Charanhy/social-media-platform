package View;

import java.awt.Color;
import java.awt.Font;

public class GUIConstants {
	
	// Modern Color Palette - Vibrant and Professional
	public static Color white = Color.white;
	public static Color black = Color.black;
	
	// Primary Brand Colors
	public static Color blue = Color.decode("#1DA1F2");           // Twitter Blue - Primary
	public static Color darkBlue = Color.decode("#0d8bd9");       // Darker Blue for hover
	public static Color lightBlue = Color.decode("#E8F5FD");      // Light Blue background
	
	// Accent Colors
	public static Color success = Color.decode("#17BF63");        // Green - Success actions
	public static Color warning = Color.decode("#FFAD1F");        // Orange - Warning
	public static Color danger = Color.decode("#E0245E");         // Red - Delete/Error
	public static Color purple = Color.decode("#7856FF");         // Purple - Special actions
	
	// Neutral Colors
	public static Color background = Color.decode("#F7F9FA");     // Light Gray background
	public static Color cardBackground = Color.decode("#FFFFFF"); // White for cards
	public static Color border = Color.decode("#E1E8ED");         // Border color
	
	// Text Colors
	public static Color textPrimary = Color.decode("#14171A");    // Primary text
	public static Color textSecondary = Color.decode("#657786");  // Secondary text
	public static Color textFieldHint = Color.decode("#AAB8C2");  // Placeholder text
	public static Color textAreaHint = Color.decode("#AAB8C2");
	public static Color post = Color.decode("#14171A");           // Post content
	
	// Interactive Colors
	public static Color hover = Color.decode("#F0F4F7");          // Hover state
	public static Color selected = Color.decode("#E8F5FD");       // Selected state
	public static Color focus = Color.decode("#1DA1F2");          // Focus border
	
	// Social Media Colors
	public static Color likeColor = Color.decode("#E0245E");      // Like button (red/pink)
	public static Color commentColor = Color.decode("#1DA1F2");   // Comment (blue)
	public static Color shareColor = Color.decode("#17BF63");     // Share (green)
	
	// Fonts
	public static Font titleFont = new Font("Segoe UI", Font.BOLD, 20);
	public static Font headerFont = new Font("Segoe UI", Font.BOLD, 16);
	public static Font bodyFont = new Font("Segoe UI", Font.PLAIN, 14);
	public static Font smallFont = new Font("Segoe UI", Font.PLAIN, 12);
	public static Font buttonFont = new Font("Segoe UI", Font.BOLD, 14);

}
