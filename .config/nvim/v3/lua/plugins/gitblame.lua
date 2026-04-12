require('gitblame').setup({
    enabled = false,
    message_template = ' <summary> • <date> • <author> • <<sha>>',
    date_format = '%Y-%m-%d %H:%M',
    virtual_text_column = 1,
})
