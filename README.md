# Name
Engie Enegry Access Test

## Description
This is an implementation of a Concern that can be re-used in multiple models to encapsulate the logic necessary to store extra / custom attributes for any model without having to create a new database field.

## Setup
The app is just a simple rails application therefore it does not require any extra setup. The general setup steps are:
 - clone the application
 - Run `bundle install` to install any missing gems
 - Run `rake db:migrate` to migrate the database

## Configuration
No configuration is required.

## Architecture
The app consists of just two models, i.e: battery and customer, and a concern: CustomAttributeable

## Impelentation
ExtraAttribute Model:
 - A ExtraAttribute model is created to store custom attribute data. It includes fields such as model_type, model_id, attribute_name, and attribute_value. The model_type attribute is used to associate the custom attribute with a specific model.

CustomAttributeable Concern:
 - The CustomAttributeable concern is defined and included in models where dynamic custom attributes are desired. The concern defines the association between the model and any extra attributes and provides methods for setting and getting custom attribute values.

Dynamic Access
 - The method_missing method is used to allow dynamic access to custom attributes using method names like `battery.manufacturer` or `customer.favorite_color`, It handles setting and getting of custom attributes by checking the method name and attribute values.

Testing:
 - Tests have been implemented to ensure that the dynamic custom attributes solution functions correctly. It includes cases for setting, getting, and modifying custom attributes for multiple models.

## How it works
The general steps include:
 - Include the CustomAttributeable concern any model you want to enable dynamic custom attributes.
 - You can now set and access custom attributes using dynamic methods as if they were regular model attributes. For example:
     ```
        customer = Customer.create(name: 'John')

        # Set custom attributes
        customer.favorite_color = 'Blue'
        customer.hobby = 'Gardening'

        # custom attributes can be retrieved
        assert_equal 'Blue', customer.favorite_color
        assert_equal 'Gardening', customer.hobby
     ```

## Testing:
A test suite is included to ensure that the solution works as expected

## Contributions and License:
  Contributions to this open-source project are welcome. Feel free to open issues or submit pull requests. The application is available under the MIT License.