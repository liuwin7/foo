# @capacitor-community/screen-orientation

Work with the screen orientation in a common way for iOS, Android, and web

## Install

```bash
npm install @capacitor-community/screen-orientation
npx cap sync
```

## API

<docgen-index>

* [`orientation()`](#orientation)
* [`lock(...)`](#lock)
* [`unlock()`](#unlock)
* [`addListener('screenOrientationChange', ...)`](#addlistenerscreenorientationchange)
* [`removeAllListeners()`](#removealllisteners)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### orientation()

```typescript
orientation() => Promise<{ type: OrientationType; }>
```

Returns the screen's current orientation.

**Returns:** <code>Promise&lt;{ type: any; }&gt;</code>

--------------------


### lock(...)

```typescript
lock(opts: { orientation: OrientationLockType; }) => Promise<void>
```

Locks the screen orientation.

| Param      | Type                               |
| ---------- | ---------------------------------- |
| **`opts`** | <code>{ orientation: any; }</code> |

--------------------


### unlock()

```typescript
unlock() => Promise<void>
```

Unlocks the screen's orientation.

--------------------


### addListener('screenOrientationChange', ...)

```typescript
addListener(eventName: "screenOrientationChange", listenerFunc: (orientation: { type: OrientationType; }) => void) => Promise<PluginListenerHandle> & PluginListenerHandle
```

Listens for screen orientation changes

| Param              | Type                                                  |
| ------------------ | ----------------------------------------------------- |
| **`eventName`**    | <code>'screenOrientationChange'</code>                |
| **`listenerFunc`** | <code>(orientation: { type: any; }) =&gt; void</code> |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt; & <a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

--------------------


### removeAllListeners()

```typescript
removeAllListeners() => Promise<void>
```

Removes all listeners.

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |

</docgen-api>
