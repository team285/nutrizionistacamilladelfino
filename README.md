# Sito Camilla Delfino — Biologa Nutrizionista

Sito vetrina statico con form di contatto via EmailJS.

## 📋 Prerequisiti

- Account [GitHub](https://github.com)
- Account [Railway](https://railway.app)
- Account [EmailJS](https://www.emailjs.com) (per il form di contatto)
- [Git](https://git-scm.com/downloads) installato sul tuo computer

## ⚙️ Configurazione EmailJS (PRIMA del deploy)

Apri `index.html` e sostituisci i 3 placeholder con le tue credenziali EmailJS:

1. **Riga ~11** — Sostituisci `EMAILJS_PUBLIC_KEY` con la tua Public Key
2. **Riga ~785** — Sostituisci `EMAILJS_SERVICE_ID` con il tuo Service ID
3. **Riga ~786** — Sostituisci `EMAILJS_TEMPLATE_ID` con il tuo Template ID

Le trovi tutte su https://dashboard.emailjs.com

> ⚠️ La Public Key è pubblica per definizione (visibile nel sorgente HTML), va bene. Su EmailJS però **attiva la whitelist dei domini** per evitare abusi: Account → Security → Allow EmailJS API for specific domains.

## 🚀 Step 1 — Pubblicazione su GitHub

Apri il terminale nella cartella del progetto ed esegui:

```bash
git init
git add .
git commit -m "Primo commit: sito Camilla Delfino"
git branch -M main
```

Poi crea un nuovo repository su GitHub (https://github.com/new), senza inizializzarlo con README. Copia l'URL e collega:

```bash
git remote add origin https://github.com/TUO-USERNAME/NOME-REPO.git
git push -u origin main
```

## 🚂 Step 2 — Deploy su Railway

1. Vai su https://railway.app e accedi
2. Clicca **New Project** → **Deploy from GitHub repo**
3. Autorizza Railway ad accedere al tuo GitHub (se è la prima volta)
4. Seleziona il repository appena creato
5. Railway rileva automaticamente il `Dockerfile` e parte il build
6. Quando il deploy è completato (~2 minuti), vai su **Settings** → **Networking** → **Generate Domain** per ottenere un URL pubblico (`xxx.up.railway.app`)

Il sito è online! 🎉

## 🌐 Step 3 — Dominio personalizzato (opzionale)

Se hai un dominio (es. `camilladelfino.it`):

1. Su Railway: **Settings** → **Networking** → **Custom Domain** → inserisci il dominio
2. Railway ti mostra un record CNAME da configurare nel pannello del tuo registrar (Aruba, GoDaddy, ecc.)
3. Aspetta la propagazione DNS (da pochi minuti a qualche ora)
4. Railway emette automaticamente un certificato SSL

## 🔄 Aggiornamenti futuri

Ogni volta che modifichi il sito:

```bash
git add .
git commit -m "Descrizione modifica"
git push
```

Railway rileva il push e fa automaticamente un nuovo deploy.

## 📁 Struttura file

- `index.html` — il sito (singolo file, tutto incluso)
- `Dockerfile` — istruzioni per costruire il container nginx
- `nginx.conf` — configurazione del server web
- `.gitignore` — file da escludere dal repo
- `README.md` — questo file

## 💰 Costi

Railway offre **$5 di credito gratis al mese** (Hobby plan). Un sito statico come questo consuma pochissimo: probabilmente starai sempre nel piano gratuito. Monitora i consumi dalla dashboard.

## ❓ Troubleshooting

**Il form non invia email**: controlla di aver sostituito i 3 placeholder EmailJS in `index.html` e che il dominio Railway sia in whitelist su EmailJS.

**Il deploy fallisce**: controlla i log nella sezione "Deployments" su Railway. Spesso è un errore nel `Dockerfile` o nel `nginx.conf`.

**Il sito è lento al primo caricamento**: normale, il file HTML pesa ~620 KB per via delle immagini base64 incorporate. Per ottimizzare, estrai le immagini in file separati `.jpg` e linkale.
