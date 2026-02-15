from setuptools import setup, find_packages

setup(
    name='apiverve_chartgenerator',
    version='1.1.13',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Chart Generator creates beautiful chart images from your data. Supports bar, line, pie, doughnut, radar, and polar area charts with customizable styling.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://chartgenerator.apiverve.com?utm_source=pypi&utm_medium=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
