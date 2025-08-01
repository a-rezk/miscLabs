from jinja2 import Template

with open('template/ex.jinja') as f:
    tmpl = Template(f.read())
    print(tmpl.render(
        list_title = 'test',
        list_description = 'Here are the example of',
        item_list = [
            'test1','test2','test3'
        ]
    ))



