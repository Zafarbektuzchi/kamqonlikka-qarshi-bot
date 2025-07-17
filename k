from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import Application, CommandHandler, CallbackQueryHandler, ContextTypes

TOKEN = "7755870871:AAH7O3UbkZZEwWjXE4Ip3WCVHdytQfscIUs"

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    keyboard = [
        [InlineKeyboardButton("🎬 Video haqida", callback_data="video")],
        [InlineKeyboardButton("📦 Tibet tuz haqida", callback_data="info")],
    ]
    reply_markup = InlineKeyboardMarkup(keyboard)
    await update.message.reply_text("Xush kelibsiz! Quyidagilardan birini tanlang:", reply_markup=reply_markup)

async def button(update: Update, context: ContextTypes.DEFAULT_TYPE):
    query = update.callback_query
    await query.answer()

    if query.data == "video":
        await query.message.reply_video(
            video="https://t.me/Tibettuz/110",  # Bu yerga videoni to'g'ridan-to'g'ri linkini qo'ydim
            caption="Kamqonlikka qarshi Tibet Tuz haqida video"
        )

    elif query.data == "info":
        await query.message.reply_text(
            "Tibet tuzi – gemoglobin ko‘taruvchi, temir, yod, foliy kislotasi va sarben bilan boyitilgan maxsus tuzdir. "
            "U zaiflik, hushsizlik va kamqonlikka qarshi yordam beradi."
        )

if __name__ == '__main__':
    app = Application.builder().token(TOKEN).build()
    app.add_handler(CommandHandler("start", start))
    app.add_handler(CallbackQueryHandler(button))
    app.run_polling()
