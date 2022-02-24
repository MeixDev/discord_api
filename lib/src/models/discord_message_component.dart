import 'discord_emoji.dart';
import 'discord_message_component_type.dart';

/// Base class for Discord Components.
///
/// Take advantage of the [DiscordMessageComponentType] enum to
/// determine the type of component, and cast the object as the right object
abstract class DiscordMessageComponent {
  /// The type of component
  final int type;

  late final DiscordMessageComponentType? _typeAsEnum;

  static const typeEntry = 'type';
  static const componentsEntry = 'components';

  DiscordMessageComponent({
    required this.type,
  });

  DiscordMessageComponentType get typeAsEnum =>
      _typeAsEnum ??= DiscordMessageComponentType.values[type];

  factory DiscordMessageComponent.fromJson(Map<String, dynamic> json) {
    switch (DiscordMessageComponentType.values[json[typeEntry]]) {
      case DiscordMessageComponentType.actionRow:
        return DiscordMessageComponentActionRow.fromJson(json[componentsEntry]);
      case DiscordMessageComponentType.button:
        return DiscordMessageComponentButton.fromJson(json[componentsEntry]);
      case DiscordMessageComponentType.selectMenu:
        return DiscordMessageComponentSelectMenu.fromJson(
            json[componentsEntry]);
      case DiscordMessageComponentType.textInput:
        return DiscordMessageComponentTextInput.fromJson(json[componentsEntry]);
      default:
        throw Exception('Unknown component type');
    }
  }
}

/// An Action Row is a non-interactive container component for other
/// types of components. It has a `type: 1` and a sub-array of `components`
///  of other types.
///
/// * You can have up to 5 Action Rows per message
/// * An Action Row cannot contain another Action Row
class DiscordMessageComponentActionRow extends DiscordMessageComponent {
  /// list of nested components, max 5
  final List<DiscordMessageComponent> components;

  static const componentsEntry = 'components';

  DiscordMessageComponentActionRow({
    required this.components,
  }) : super(type: DiscordMessageComponentType.actionRow.index);

  factory DiscordMessageComponentActionRow.fromJson(
          Map<String, dynamic> json) =>
      DiscordMessageComponentActionRow(
        components: List<DiscordMessageComponent>.from(
            json[componentsEntry].map(DiscordMessageComponent.fromJson)),
      );
}

/// Buttons are interactive components that render on messages.
/// They can be clicked by users, and send an interaction to your
/// app when clicked.
///
/// * Buttons must be sent inside an Action Row
/// * An Action Row can contain up to 5 buttons
/// * An Action Row containing buttons cannot also contain a select menu
class DiscordMessageComponentButton extends DiscordMessageComponent {
  /// one of [button styles](https://discord.com/developers/docs/interactions/message-components#button-object-button-styles)
  final int style;

  late final DiscordMessageComponentButtonStyle? _styleAsEnum;

  /// text that appears on the button, max 80 characters
  ///
  /// is not always returned, hence the nullable property
  final String? label;

  /// with the fields `name`, `id`, and `animated`
  ///
  /// is not always returned, hence the nullable property
  final DiscordEmoji? emoji;

  /// a developer-defined identifier for the button,
  /// max 100 characters
  ///
  /// Components, aside from Action Rows, must have a `custom_id` field.
  /// This field is defined by the developer when sending the component
  /// payload, and is returned in the interaction payload sent when a user
  /// interacts with the component. For example, if you set `custom_id: click_me`
  /// on a button, you'll receive an interaction containing
  /// `custom_id: click_me` when a user clicks that button.
  ///
  /// `custom_id` must be unique per component; multiple buttons on
  /// the same message must not share the same `custom_id`.
  /// This field is a string of max 100 characters, and can be used
  /// flexibly to maintain state or pass through other important data.
  ///
  /// is not always returned, hence the nullable property
  final String? customId;

  /// a url for link-style buttons
  ///
  /// is not always returned, hence the nullable property
  final String? url;

  /// whether the button is disabled (default `false`)
  ///
  /// is not always returned, hence the nullable property
  final bool? disabled;

  static const styleEntry = 'style';
  static const labelEntry = 'label';
  static const emojiEntry = 'emoji';
  static const customIdEntry = 'custom_id';
  static const urlEntry = 'url';
  static const disabledEntry = 'disabled';

  DiscordMessageComponentButton({
    required this.style,
    this.label,
    this.emoji,
    this.customId,
    this.url,
    this.disabled,
  }) : super(type: DiscordMessageComponentType.button.index);

  DiscordMessageComponentButtonStyle get styleAsEnum =>
      _styleAsEnum ??= DiscordMessageComponentButtonStyle.values[style];

  factory DiscordMessageComponentButton.fromJson(Map<String, dynamic> json) =>
      DiscordMessageComponentButton(
        style: json[styleEntry] as int,
        label: json[labelEntry] as String?,
        emoji: json[emojiEntry] != null
            ? DiscordEmoji.fromJson(json[emojiEntry] as Map<String, dynamic>)
            : null,
        customId: json[customIdEntry] as String?,
        url: json[urlEntry] as String?,
        disabled: json[disabledEntry] as bool?,
      );
}

enum DiscordMessageComponentButtonStyle {
  unused,

  /// value: 1, color: blurple
  /// required field: custom_id
  primary,

  /// value: 2, color: grey
  /// required field: custom_id
  secondary,

  /// value: 3, color: green
  /// required field: custom_id
  success,

  /// value: 4, color: red
  /// required field: custom_id
  danger,

  /// value: 5, color: grey, navigates to a URL
  /// required field: url
  link,
}

/// Select menus are another interactive component that renders on
/// messages. On desktop, clicking on a select menu opens a
/// dropdown-style UI; on mobile, tapping a select menu opens up a
/// half-sheet with the options.
///
/// Select menus support single-select and multi-select behavior,
/// meaning you can prompt a user to choose just one item from a list,
/// or multiple. When a user finishes making their choice by clicking
/// out of the dropdown or closing the half-sheet, your app will receive
/// an [interaction](https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-object-interaction-structure).
///
/// * Select menus must be sent inside an Action Row
/// * An Action Row can contain only one select menu
/// * An Action Row containing a select menu cannot also contain buttons

class DiscordMessageComponentSelectMenu extends DiscordMessageComponent {
  /// a developer-defined identifier for the button, max 100 characters
  ///
  /// Components, aside from Action Rows, must have a `custom_id` field.
  /// This field is defined by the developer when sending the component
  /// payload, and is returned in the interaction payload sent when a user
  /// interacts with the component. For example, if you set `custom_id: click_me`
  /// on a button, you'll receive an interaction containing
  /// `custom_id: click_me` when a user clicks that button.
  ///
  /// `custom_id` must be unique per component; multiple buttons on
  /// the same message must not share the same `custom_id`.
  /// This field is a string of max 100 characters, and can be used
  /// flexibly to maintain state or pass through other important data.
  final String customId;

  /// the choices in the select, max 25
  final List<DiscordMessageComponentSelectMenuOption> options;

  /// custom placeholder text if nothing is selected, max 100 characters
  ///
  /// is not always returned, hence the nullable property
  final String? placeholder;

  /// the minimum number of options that must be chosen;
  /// default 1, min 0, max 25
  ///
  /// is not always returned, hence the nullable property
  final int? minValues;

  /// the maximum number of options that can be chosen;
  /// default 1, max 25
  ///
  /// is not always returned, hence the nullable property
  final int? maxValues;

  /// disable the select, default false
  ///
  /// is not always returned, hence the nullable property
  final bool? disabled;

  static const customIdEntry = 'custom_id';
  static const optionsEntry = 'options';
  static const placeholderEntry = 'placeholder';
  static const minValuesEntry = 'min_values';
  static const maxValuesEntry = 'max_values';
  static const disabledEntry = 'disabled';

  DiscordMessageComponentSelectMenu({
    required this.customId,
    required this.options,
    this.placeholder,
    this.minValues,
    this.maxValues,
    this.disabled,
  }) : super(type: DiscordMessageComponentType.selectMenu.index);

  factory DiscordMessageComponentSelectMenu.fromJson(
          Map<String, dynamic> json) =>
      DiscordMessageComponentSelectMenu(
        customId: json[customIdEntry] as String,
        options: List<DiscordMessageComponentSelectMenuOption>.from(
          (json[optionsEntry]).map(
            DiscordMessageComponentSelectMenuOption.fromJson,
          ),
        ),
        placeholder: json[placeholderEntry] as String?,
        minValues: json[minValuesEntry] as int?,
        maxValues: json[maxValuesEntry] as int?,
        disabled: json[disabledEntry] as bool?,
      );
}

class DiscordMessageComponentSelectMenuOption {
  /// the user-facing name of the option, max 100 characters
  final String label;

  ///	the dev-define value of the option, max 100 characters
  final String value;

  ///	an additional description of the option, max 100 characters
  ///
  /// is not always returned, hence the nullable property
  final String? description;

  /// with the fields `name`, `id`, and `animated`
  ///
  /// is not always returned, hence the nullable property
  final DiscordEmoji? emoji;

  /// will render this option as selected by default
  final bool? default_;

  static const labelEntry = 'label';
  static const valueEntry = 'value';
  static const descriptionEntry = 'description';
  static const emojiEntry = 'emoji';
  static const defaultEntry = 'default';

  DiscordMessageComponentSelectMenuOption({
    required this.label,
    required this.value,
    this.description,
    this.emoji,
    this.default_,
  });

  factory DiscordMessageComponentSelectMenuOption.fromJson(
          Map<String, dynamic> json) =>
      DiscordMessageComponentSelectMenuOption(
        label: json[labelEntry] as String,
        value: json[valueEntry] as String,
        description: json[descriptionEntry] as String?,
        emoji: json[emojiEntry] != null
            ? DiscordEmoji.fromJson(json[emojiEntry] as Map<String, dynamic>)
            : null,
        default_: json[defaultEntry] as bool?,
      );
}

/// Text inputs are an interactive component that render on modals.
/// They can be used to collect short-form or long-form text.
class DiscordMessageComponentTextInput extends DiscordMessageComponent {
  /// a developer-defined identifier for the button, max 100 characters
  ///
  /// Components, aside from Action Rows, must have a `custom_id` field.
  /// This field is defined by the developer when sending the component
  /// payload, and is returned in the interaction payload sent when a user
  /// interacts with the component. For example, if you set `custom_id: click_me`
  /// on a button, you'll receive an interaction containing
  /// `custom_id: click_me` when a user clicks that button.
  ///
  /// `custom_id` must be unique per component; multiple buttons on
  /// the same message must not share the same `custom_id`.
  /// This field is a string of max 100 characters, and can be used
  /// flexibly to maintain state or pass through other important data.
  final String customId;

  /// the [Text Input Style](https://discord.com/developers/docs/interactions/message-components#text-inputs-text-input-styles)
  final int style;

  late final DiscordMessageComponentTextInputStyle? _styleAsEnum;

  /// the label for this component
  final String label;

  ///	the minimum input length for a text input, min 0, max 4000
  ///
  /// is not always returned, hence the nullable property
  final int? minLength;

  ///	the maximum input length for a text input, min 1, max 4000
  ///
  /// is not always returned, hence the nullable property
  final int? maxLength;

  /// whether this component is required to be filled, default true
  ///
  /// is not always returned, hence the nullable property
  final bool? required;

  ///	a pre-filled value for this component, max 4000 characters
  final String? value;

  ///	custom placeholder text if the input is empty, max 100 characters
  final String? placeholder;

  static const customIdEntry = 'custom_id';
  static const styleEntry = 'style';
  static const labelEntry = 'label';
  static const minLengthEntry = 'min_length';
  static const maxLengthEntry = 'max_length';
  static const requiredEntry = 'required';
  static const valueEntry = 'value';
  static const placeholderEntry = 'placeholder';

  DiscordMessageComponentTextInput({
    required this.customId,
    required this.style,
    required this.label,
    this.minLength,
    this.maxLength,
    this.required,
    this.value,
    this.placeholder,
  }) : super(type: DiscordMessageComponentType.textInput.index);

  DiscordMessageComponentTextInputStyle get styleAsEnum =>
      _styleAsEnum ??= DiscordMessageComponentTextInputStyle.values[style];

  factory DiscordMessageComponentTextInput.fromJson(
          Map<String, dynamic> json) =>
      DiscordMessageComponentTextInput(
        customId: json[customIdEntry] as String,
        style: json[styleEntry] as int,
        label: json[labelEntry] as String,
        minLength: json[minLengthEntry] as int?,
        maxLength: json[maxLengthEntry] as int?,
        required: json[requiredEntry] as bool?,
        value: json[valueEntry] as String?,
        placeholder: json[placeholderEntry] as String?,
      );
}

enum DiscordMessageComponentTextInputStyle {
  unused,

  /// A single-line input
  short,

  /// A multi-line input
  paragraph,
}
