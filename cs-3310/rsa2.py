import random


class RSA:
    def twentySixToTen(self,bnum):
        base_twentysix = "abcdefghijklmnopqrstuvwxyz"
        bten = 0
        for c in bnum:
            if c in base_twentysix:
                bten = bten*26
                bten += base_twentysix.index(c)
            else:
                print "Invalid character in string: '%s'"%c
                return 0
        return bten

    def tenToSeventy(self,bten):
        base_seventy = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.?! \t\n\r"
        bseventy = ""
        charlist = []
        num = bten
        while num != 0:
            remainder = num%70
            num = num/70
            charlist.append(base_seventy[remainder])
        for i in range(len(charlist)-1,-1,-1):
            bseventy += charlist[i]
        return bseventy

    def MillersTest(self,n,b):
        if n > 2 and n % 2 == 0:
            return False
        s = 0
        t = n - 1
        while t % 2 == 0:
            s += 1
            t = t/2
        if pow(b,t,n) == 1:
            return True
        for i in range(0,s):
            if pow(b,2**i*t,n)==n-1:
                return True
        return False
        
    def LikelyPrime(self,n):
        for i in range(10):
            b = random.randrange(2,n-1)
            millerpass = self.MillersTest(n,b)
            if not millerpass:
                return False
        return True

    def egcd(self,a,b):
        x,y, u,v = 0,1, 1,0
        while a != 0:
            q, r = b//a, b%a
            m, n = x-u*q, y-v*q
            b,a, x,y, u,v = a,r, u,v, m,n
        gcd = b
        return gcd, x, y

    def modinv(self,a,m):
        gcd, x, y = self.egcd(a, m)
        if gcd != 1:
            return None
        else:
            return x % m
    
    def GenerateKeys(self,stringP,stringQ):
        P = self.twentySixToTen(stringP) % pow(10,200)
        Q = self.twentySixToTen(stringQ) % pow(10,200)
        if P % 2 == 0:
            P += 1
        if Q % 2 == 0:
            Q += 1
        while not self.LikelyPrime(P):
            P += 2
        while not self.LikelyPrime(Q):
            Q += 2
        N = P * Q
        R = (P - 1)*(Q - 1)
        E = N / pow(10,300)
        if E % 2 == 0:
            E += 1
        while not self.LikelyPrime(E) or E % R == 0:
            E += 2
        D = self.modinv(E,R)
        f = open("public.txt","w")
        f.write("%s\n%s\n"%(N,E))
        f.close()
        f = open("private.txt","w")
        f.write("%s\n%s\n"%(N,D))
        f.close()

    def Encrypt(self,infile):
        print "Encrypting... "
        f = open(infile,"r")
        bnum = f.read()
        f.close()
        g = open("public.txt","r")
        N = int(g.readline())
        E = int(g.readline())
        g.close()
        base_seventy = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.?! \t\n\r"
        bten = 0
        h = open("output.txt","w")
        for c in bnum:
            if c in base_seventy:
                if bten*70 + base_seventy.index(c) > N:
                    h.write(self.tenToSeventy(pow(bten,E,N)))
                    h.write("$")
                else:
                    bten = bten*70
                    bten += base_seventy.index(c)
            else:
                print "Invalid character in string: '%s'"%c
        h.write(self.tenToSeventy(pow(bten,E,N)))
        h.write("$")
        h.close()
        print "Encryption complete."

    def Decrypt(self,infile):
        print "Decrypting... "
        f = open(infile,"r")
        blocks = f.read().split("$")
        f.close()
        g = open("private.txt","r")
        N = int(g.readline())
        D = int(g.readline())
        g.close()
        base_seventy = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.?! \t\n\r"
        h = open("decrypt.txt","w")
        for b in blocks:
            bten = 0
            if b == "":
                break
            else:
                for c in b:
                    if c in base_seventy:
                        bten = bten*70
                        bten += base_seventy.index(c)
                    else:
                        print "Invalid character in string: '%s'"%c
                h.write(self.tenToSeventy(pow(bten,D,N)))
        h.close()
        print "Decryption complete."

def main():
    r = RSA()
    #r.GenerateKeys("kuqroijsdfvdvjndfrgehroigdfkgjkcnbhiewqueiurfiquebrivbeuqhfvjxvhxbjfdsgberuyrwgtdhfbgsmhfrgtuweyrgcdbfgkhdertkerhgoidhgkjdsfmbvxbcfkgjuhewiruhgsdfkjghskerutkeghkdsfnbmcxgkehrtiuheorglskdfgbxncfjghkejrhtoihsdfbnxcnfkgjhreiusdaifuhadfkjghdskfgureiughdsjfgkuicvbuhixcuvkdjfghkjhksjdfhgkroiwetuoioiuoweirtoidfgksjdoritoigjlksdfjgosidurtoiwerlkgjsdifgjoeirjglixjcofibjoerijgonerkjgiewrviusdifubvixocufhogieroighsodfnbkjxcofgiheroignkjsdnfoguhseorihogrboiutehrsoighdsifhgotihoijhoisjoisjdoijoriehgiuehgjhdsfgiuheirughksdjfhgkisdhfiguhkerjgkjxbncdfkjbvhoeirhogishdfkjgxkcfhgiouehrobjxkcfjngoiuehrobjxkcjf","weoriubcxjvnboiuernigusdifjbixcjhbiouerigufndijfsnbvisdbfiovugbeqriubiudfhibuvhdeirsuthiqeugidfsjbiusdfiguerqituqeirguehirguhdsfiubxicjbfkjhrebquryhbfjhsdfjvhbxcjkhbgvieubriougvybcxijhvbiedhgoiuerivunsdifubvisdufiuvgusdfgiuhusdgsdusuisdjfdsbvierubgvgsbdmrhtbweyrgiudyfvxjplwekrmwblirntoibnfogpbiofsdighieubvifdsugbdfiugegbidfungbkxcufhgoweirughjxkcfjbhlsdigturhekgsjhxcfkjbhksehgiwuedhrgiuhsdfjbhxrjehbjrhbgkjsdgkjxckvbuhieurhgkjxncfbunoerioiwierhfgkjsdhfoxciufgiuwehirhgkjxhcfiguheoirhgsdkk")
    #r.Encrypt("input.txt")
    r.Decrypt("ZachEncrypted.txt")
main()