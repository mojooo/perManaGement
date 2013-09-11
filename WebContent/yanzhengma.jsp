<%@ page 
 contentType="image/jpeg" 
 import="java.awt.image.*,java.awt.*,java.util.*,javax.imageio.*"
%>
<%! 
    public Color getRandomColor(int firstcolor,int secondcolor)
    {
        Random random = new Random();
        if(firstcolor>255) firstcolor=255;
        if(secondcolor>255) secondcolor=255;
        int r=firstcolor+random.nextInt(secondcolor-firstcolor);
        int g=firstcolor+random.nextInt(secondcolor-firstcolor);
        int b=firstcolor+random.nextInt(secondcolor-firstcolor);
        return new Color(r,g,b);
   }
%>
<% 
		int width=60,height=20;
		BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);	
		Graphics g= image.getGraphics();	
		Random random=new Random();
		g.setColor(getRandomColor(200,250));
		g.fillRect(0, 0, width, height);	
		g.setFont(new Font("Times New Roman",Font.PLAIN,18));	
		g.setColor(getRandomColor(160,200));
		for (int i=0;i<155;i++)
		{
		 	int x = random.nextInt(width);
		 	int y = random.nextInt(height);
		        int xl = random.nextInt(12);
		        int yl = random.nextInt(12);
		 	g.drawLine(x,y,x+xl,y+yl);
		}
		String yanZhengMa="";
		for (int i=0;i<4;i++){
			int leixing=random.nextInt(62);
			String yanzhengmatemp="r";
			if(leixing<10)
			{
				yanzhengmatemp=String.valueOf(random.nextInt(10));
			}
			else if(leixing<36)
			{
				yanzhengmatemp=((char)(random.nextInt(122-97)+97))+"";
			}
			else
			{
				yanzhengmatemp=((char)(random.nextInt(90-65)+65))+"";
			}
		    yanZhengMa+=yanzhengmatemp;
		    g.setColor(new Color(25+random.nextInt(110),25+random.nextInt(110),25+random.nextInt(110)));
			g.drawString(yanzhengmatemp,13*i+6,16);
		}
	
		session.setAttribute("yzm",yanZhengMa.toLowerCase());
		g.dispose();
		ImageIO.write(image, "JPEG", response.getOutputStream());
	    out.clear();
	    out = pageContext.pushBody();
%>
	


		